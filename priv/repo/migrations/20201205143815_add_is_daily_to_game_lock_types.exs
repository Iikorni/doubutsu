defmodule Doubutsu.Repo.Migrations.AddIsDailyToGameLockTypes do
  use Ecto.Migration

  def change do
    alter table(:game_lock_types) do
      add :is_daily, :boolean, default: false
    end
  end
end
