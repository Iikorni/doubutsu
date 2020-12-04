defmodule Doubutsu.Repo.Migrations.CreateGameLocks do
  use Ecto.Migration

  def change do
    create table(:game_locks) do
      add :count, :integer
      add :user_id, references(:users, on_delete: :nothing)
      add :game_lock_type_id, references(:game_lock_types, on_delete: :nothing)

      timestamps()
    end

    create index(:game_locks, [:user_id])
    create index(:game_locks, [:game_lock_type_id])
  end
end
