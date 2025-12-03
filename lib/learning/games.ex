defmodule Learning.Games do
  @moduledoc """
  The Games context for managing game results and statistics.
  """

  import Ecto.Query, warn: false
  alias Learning.Repo
  alias Learning.Games.GameResult

  @doc """
  Creates a game result.
  """
  def create_game_result(attrs \\ %{}) do
    %GameResult{}
    |> GameResult.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Gets all game results for a user, ordered by most recent.
  """
  def list_user_results(user_id) do
    GameResult
    |> where([r], r.user_id == ^user_id)
    |> order_by([r], desc: r.inserted_at)
    |> Repo.all()
  end

  @doc """
  Gets the user's best score.
  """
  def get_best_score(user_id) do
    GameResult
    |> where([r], r.user_id == ^user_id)
    |> select([r], max(r.score))
    |> Repo.one()
  end

  @doc """
  Gets the user's best streak ever.
  """
  def get_best_streak(user_id) do
    GameResult
    |> where([r], r.user_id == ^user_id)
    |> select([r], max(r.best_streak))
    |> Repo.one()
  end

  @doc """
  Gets user statistics summary.
  """
  def get_user_stats(user_id) do
    results = list_user_results(user_id)
    
    if Enum.empty?(results) do
      %{
        games_played: 0,
        best_score: nil,
        best_streak: nil,
        average_score: nil,
        total_questions_answered: 0
      }
    else
      total_score = Enum.sum(Enum.map(results, & &1.score))
      total_questions = Enum.sum(Enum.map(results, & &1.total_questions))
      
      %{
        games_played: length(results),
        best_score: Enum.max_by(results, & &1.score).score,
        best_streak: Enum.max_by(results, & &1.best_streak).best_streak,
        average_score: Float.round(total_score / length(results), 1),
        total_questions_answered: total_questions
      }
    end
  end

  @doc """
  Gets recent results for a user (last 5).
  """
  def get_recent_results(user_id, limit \\ 5) do
    GameResult
    |> where([r], r.user_id == ^user_id)
    |> order_by([r], desc: r.inserted_at)
    |> limit(^limit)
    |> Repo.all()
  end
end
