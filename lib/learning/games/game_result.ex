defmodule Learning.Games.GameResult do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "game_results" do
    field :score, :integer
    field :total_questions, :integer
    field :best_streak, :integer, default: 0
    field :time_taken_seconds, :integer

    belongs_to :user, Learning.Accounts.User

    timestamps(type: :utc_datetime)
  end

  def changeset(game_result, attrs) do
    game_result
    |> cast(attrs, [:score, :total_questions, :best_streak, :time_taken_seconds, :user_id])
    |> validate_required([:score, :total_questions, :user_id])
    |> validate_number(:score, greater_than_or_equal_to: 0)
    |> validate_number(:total_questions, greater_than: 0)
    |> foreign_key_constraint(:user_id)
  end
end
