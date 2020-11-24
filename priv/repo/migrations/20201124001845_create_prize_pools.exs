defmodule Doubutsu.Repo.Migrations.CreatePrizePools do
  use Ecto.Migration

  def change do
    create table(:prize_pools) do
      add :name, :string
      add :description, :text

      timestamps()
    end

  end
end
