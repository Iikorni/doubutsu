defmodule Doubutsu.Repo.Migrations.AddLastLockTimeToGameLocks do
  use Ecto.Migration

  def change do
    alter table(:game_locks) do
      add :last_lock_time, :naive_datetime
    end
  end
end
