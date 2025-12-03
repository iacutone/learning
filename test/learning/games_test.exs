defmodule Learning.GamesTest do
  use Learning.DataCase

  alias Learning.Games
  alias Learning.Games.GameResult
  alias Learning.AccountsFixtures
  alias Learning.GamesFixtures

  describe "create_game_result/1" do
    test "creates a game result with valid data" do
      user = AccountsFixtures.user_fixture()

      attrs = %{
        user_id: user.id,
        score: 8,
        total_questions: 12,
        best_streak: 4,
        time_taken_seconds: 90
      }

      assert {:ok, %GameResult{} = result} = Games.create_game_result(attrs)
      assert result.score == 8
      assert result.total_questions == 12
      assert result.best_streak == 4
      assert result.time_taken_seconds == 90
      assert result.user_id == user.id
    end

    test "returns error with invalid data" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game_result(%{})
    end

    test "returns error with negative score" do
      user = AccountsFixtures.user_fixture()

      attrs = %{
        user_id: user.id,
        score: -1,
        total_questions: 12
      }

      assert {:error, changeset} = Games.create_game_result(attrs)
      assert "must be greater than or equal to 0" in errors_on(changeset).score
    end

    test "returns error with zero total_questions" do
      user = AccountsFixtures.user_fixture()

      attrs = %{
        user_id: user.id,
        score: 5,
        total_questions: 0
      }

      assert {:error, changeset} = Games.create_game_result(attrs)
      assert "must be greater than 0" in errors_on(changeset).total_questions
    end
  end

  describe "list_user_results/1" do
    test "returns all results for a user" do
      user = AccountsFixtures.user_fixture()
      GamesFixtures.game_result_fixture(%{user: user, score: 5})
      GamesFixtures.game_result_fixture(%{user: user, score: 10})

      results = Games.list_user_results(user.id)

      assert length(results) == 2
      scores = Enum.map(results, & &1.score)
      assert 5 in scores
      assert 10 in scores
    end

    test "returns empty list for user with no results" do
      user = AccountsFixtures.user_fixture()
      assert Games.list_user_results(user.id) == []
    end

    test "does not return results from other users" do
      user1 = AccountsFixtures.user_fixture()
      user2 = AccountsFixtures.user_fixture()

      GamesFixtures.game_result_fixture(%{user: user1})
      GamesFixtures.game_result_fixture(%{user: user2})

      results = Games.list_user_results(user1.id)
      assert length(results) == 1
    end
  end

  describe "get_best_score/1" do
    test "returns the highest score for a user" do
      user = AccountsFixtures.user_fixture()
      GamesFixtures.game_result_fixture(%{user: user, score: 5})
      GamesFixtures.game_result_fixture(%{user: user, score: 12})
      GamesFixtures.game_result_fixture(%{user: user, score: 8})

      assert Games.get_best_score(user.id) == 12
    end

    test "returns nil for user with no results" do
      user = AccountsFixtures.user_fixture()
      assert Games.get_best_score(user.id) == nil
    end
  end

  describe "get_best_streak/1" do
    test "returns the highest streak for a user" do
      user = AccountsFixtures.user_fixture()
      GamesFixtures.game_result_fixture(%{user: user, best_streak: 3})
      GamesFixtures.game_result_fixture(%{user: user, best_streak: 7})
      GamesFixtures.game_result_fixture(%{user: user, best_streak: 5})

      assert Games.get_best_streak(user.id) == 7
    end

    test "returns nil for user with no results" do
      user = AccountsFixtures.user_fixture()
      assert Games.get_best_streak(user.id) == nil
    end
  end

  describe "get_user_stats/1" do
    test "returns correct stats for user with results" do
      user = AccountsFixtures.user_fixture()
      GamesFixtures.game_result_fixture(%{user: user, score: 10, total_questions: 12, best_streak: 5})
      GamesFixtures.game_result_fixture(%{user: user, score: 8, total_questions: 12, best_streak: 3})

      stats = Games.get_user_stats(user.id)

      assert stats.games_played == 2
      assert stats.best_score == 10
      assert stats.best_streak == 5
      assert stats.average_score == 9.0
      assert stats.total_questions_answered == 24
    end

    test "returns zeroed stats for user with no results" do
      user = AccountsFixtures.user_fixture()

      stats = Games.get_user_stats(user.id)

      assert stats.games_played == 0
      assert stats.best_score == nil
      assert stats.best_streak == nil
      assert stats.average_score == nil
      assert stats.total_questions_answered == 0
    end
  end

  describe "get_recent_results/2" do
    test "returns limited recent results" do
      user = AccountsFixtures.user_fixture()

      for i <- 1..10 do
        GamesFixtures.game_result_fixture(%{user: user, score: i})
      end

      results = Games.get_recent_results(user.id, 5)

      assert length(results) == 5
    end

    test "returns all results if fewer than limit" do
      user = AccountsFixtures.user_fixture()
      GamesFixtures.game_result_fixture(%{user: user})
      GamesFixtures.game_result_fixture(%{user: user})

      results = Games.get_recent_results(user.id, 5)

      assert length(results) == 2
    end
  end
end
