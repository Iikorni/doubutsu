defmodule Doubutsu.Repo.Migrations.CreateGameLockTypes do
  use Ecto.Migration

  def change do
    create table(:game_lock_types) do
      add :name, :string
      add :description, :text
      add :max_count, :integer

      timestamps()
    end

  end
end
