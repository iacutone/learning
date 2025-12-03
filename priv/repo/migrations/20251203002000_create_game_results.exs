defmodule Learning.Repo.Migrations.CreateGameResults do
  use Ecto.Migration

  def change do
    create table(:game_results, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :score, :integer, null: false
      add :total_questions, :integer, null: false
      add :best_streak, :integer, default: 0
      add :time_taken_seconds, :integer
      add :user_id, references(:users, on_delete: :delete_all, type: :binary_id), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:game_results, [:user_id])
  end
end
