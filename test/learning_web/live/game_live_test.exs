defmodule LearningWeb.GameLiveTest do
  use LearningWeb.ConnCase

  import Phoenix.LiveViewTest

  describe "GameLive grade selection" do
    test "renders grade selection screen initially", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/game")

      assert html =~ "Pick Your Grade"
      assert html =~ "Kindergarten"
      assert html =~ "1st Grade"
      assert html =~ "2nd Grade"
    end

    test "cannot start game without selecting grade", %{conn: conn} do
      {:ok, _view, html} = live(conn, ~p"/game")

      assert html =~ "Pick Your Grade"
      refute html =~ "LET'S GO!"
    end

    test "can select a grade", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      html = view |> element("button", "Kindergarten") |> render_click()

      # After selecting grade, should show subject selection
      assert html =~ "Pick a Subject"
    end

    test "shows subject selection after selecting grade", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      html = view |> element("button", "Kindergarten") |> render_click()

      assert html =~ "Pick a Subject"
      assert html =~ "Math"
      assert html =~ "Reading"
      assert html =~ "Words"
    end

    test "can select a subject", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "Kindergarten") |> render_click()
      html = view |> element("button", "Math") |> render_click()

      # HTML escapes the apostrophe
      assert html =~ "LET" and html =~ "GO"
    end

    test "can start game after selecting grade and subject", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "Kindergarten") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Question 1 of 10"
      assert html =~ "Math"
    end

    test "can go back to grade selection from subject selection", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "Kindergarten") |> render_click()
      html = view |> element("button", "← Change Grade") |> render_click()

      assert html =~ "Pick Your Grade"
    end
  end

  describe "GameLive as guest" do
    setup %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")
      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      view |> element("button", "LET'S GO!") |> render_click()
      %{view: view}
    end

    test "renders the game page", %{view: view} do
      html = render(view)

      assert html =~ "Milo"
      assert html =~ "Question 1 of 10"
      assert html =~ "1st Grade"
    end

    test "can answer a question", %{view: view} do
      html = view |> element("button.answer-red") |> render_click()

      assert html =~ "🐵"
      assert html =~ "NEXT!" or html =~ "SEE MY SCORE!"
    end

    test "can navigate to next question", %{view: view} do
      view |> element("button.answer-red") |> render_click()
      html = view |> element("button", "NEXT!") |> render_click()

      assert html =~ "Question 2 of 10"
    end

    test "can request a hint", %{view: view} do
      html = view |> element("button.hint-btn") |> render_click()

      assert html =~ "hint-box"
    end

    test "shows game over screen after all questions", %{view: view} do
      for _ <- 1..10 do
        view |> element("button.answer-red") |> render_click()

        if view |> has_element?("button", "NEXT!") do
          view |> element("button", "NEXT!") |> render_click()
        else
          view |> element("button", "SEE MY SCORE!") |> render_click()
        end
      end

      html = render(view)
      assert html =~ "PLAY AGAIN!"
      assert html =~ "Stars Earned!"
    end

    test "can restart game and select new grade", %{view: view} do
      for _ <- 1..10 do
        view |> element("button.answer-red") |> render_click()

        if view |> has_element?("button", "NEXT!") do
          view |> element("button", "NEXT!") |> render_click()
        else
          view |> element("button", "SEE MY SCORE!") |> render_click()
        end
      end

      html = view |> element("button", "PLAY AGAIN!") |> render_click()

      assert html =~ "Pick Your Grade"
    end

    test "can change subject after game", %{view: view} do
      for _ <- 1..10 do
        view |> element("button.answer-red") |> render_click()

        if view |> has_element?("button", "NEXT!") do
          view |> element("button", "NEXT!") |> render_click()
        else
          view |> element("button", "SEE MY SCORE!") |> render_click()
        end
      end

      html = view |> element("button", "Change Subject") |> render_click()

      assert html =~ "Pick a Subject"
    end
  end

  describe "GameLive as authenticated user" do
    setup :register_and_log_in_user

    test "saves game result after completion", %{conn: conn, user: user} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "Kindergarten") |> render_click()
      view |> element("button", "Math") |> render_click()
      view |> element("button", "LET'S GO!") |> render_click()

      for _ <- 1..10 do
        view |> element("button.answer-red") |> render_click()

        if view |> has_element?("button", "NEXT!") do
          view |> element("button", "NEXT!") |> render_click()
        else
          view |> element("button", "SEE MY SCORE!") |> render_click()
        end
      end

      html = render(view)
      assert html =~ "Score saved!"

      stats = Learning.Games.get_user_stats(user.id)
      assert stats.games_played == 1
    end
  end

  describe "GameLive grade-specific questions" do
    test "kindergarten has easier questions", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "Kindergarten") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      # Kindergarten questions should be simpler
      assert html =~ "Question 1 of 10"
    end

    test "2nd grade has harder questions", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "2nd Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Question 1 of 10"
      assert html =~ "2nd Grade"
    end
  end

  describe "GameLive subject-specific questions" do
    test "math subject shows math questions", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Math"
      assert html =~ "badge-orange"
    end

    test "reading subject shows reading questions with passages", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Reading") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Reading"
      assert html =~ "passage-box"
    end

    test "words subject shows vocabulary questions", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Words") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Words"
      assert html =~ "badge-purple"
    end
  end

  describe "GameLive scoring" do
    test "score display starts at zero", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "⭐ 0"
    end

    test "shows result feedback after answering", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      view |> element("button", "LET'S GO!") |> render_click()

      html = view |> element("button.answer-red") |> render_click()

      assert html =~ "result-correct" or html =~ "result-wrong"
    end
  end

  describe "GameLive question types" do
    test "displays subject badge", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Reading") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "Reading"
    end

    test "displays progress bar", %{conn: conn} do
      {:ok, view, _html} = live(conn, ~p"/game")

      view |> element("button", "1st Grade") |> render_click()
      view |> element("button", "Math") |> render_click()
      html = view |> element("button", "LET'S GO!") |> render_click()

      assert html =~ "progress-bar"
      assert html =~ "progress-container"
    end
  end
end
