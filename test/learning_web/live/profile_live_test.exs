defmodule LearningWeb.ProfileLiveTest do
  use LearningWeb.ConnCase

  import Phoenix.LiveViewTest
  import Learning.AccountsFixtures

  describe "Profile page" do
    test "redirects if not logged in", %{conn: conn} do
      result = get(conn, ~p"/profile")
      assert redirected_to(result) == ~p"/users/log_in"
    end

    test "renders profile page for logged in user", %{conn: conn} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      {:ok, _view, html} = live(conn, ~p"/profile")

      assert html =~ "My Progress"
      assert html =~ "My Stats"
      assert html =~ "Games Played"
    end

    test "shows empty state when no games played", %{conn: conn} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      {:ok, _view, html} = live(conn, ~p"/profile")

      assert html =~ "No games played yet"
      assert html =~ "Play Now"
    end

    test "shows game history when games have been played", %{conn: conn} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      # Create a game result
      Learning.Games.create_game_result(%{
        user_id: user.id,
        score: 8,
        total_questions: 10,
        best_streak: 5,
        time_taken_seconds: 120
      })

      {:ok, _view, html} = live(conn, ~p"/profile")

      assert html =~ "8/10"
      assert html =~ "80%"
      assert html =~ "🔥 5"
    end

    test "displays correct stats", %{conn: conn} do
      user = user_fixture()
      conn = log_in_user(conn, user)

      # Create multiple game results
      Learning.Games.create_game_result(%{user_id: user.id, score: 7, total_questions: 10, best_streak: 3, time_taken_seconds: 100})
      Learning.Games.create_game_result(%{user_id: user.id, score: 9, total_questions: 10, best_streak: 6, time_taken_seconds: 90})

      {:ok, _view, html} = live(conn, ~p"/profile")

      # Should show 2 games played
      assert html =~ "2"
      # Best score should be 9
      assert html =~ "9"
      # Best streak should be 6
      assert html =~ "6"
    end
  end
end
