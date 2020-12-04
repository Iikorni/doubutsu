defmodule Doubutsu.Repo.Migrations.AddLockDurationToGameLockTypes do
  use Ecto.Migration

  def change do
    alter table(:game_lock_types) do
      add :lock_duration, :integer
    end
  end
end
