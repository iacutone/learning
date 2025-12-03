defmodule Learning.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Learning.Games` context.
  """

  alias Learning.AccountsFixtures

  def valid_game_result_attributes(attrs \\ %{}) do
    user = attrs[:user] || AccountsFixtures.user_fixture()

    Enum.into(attrs, %{
      user_id: user.id,
      score: 10,
      total_questions: 12,
      best_streak: 5,
      time_taken_seconds: 120
    })
  end

  def game_result_fixture(attrs \\ %{}) do
    {:ok, game_result} =
      attrs
      |> valid_game_result_attributes()
      |> Learning.Games.create_game_result()

    game_result
  end
end
