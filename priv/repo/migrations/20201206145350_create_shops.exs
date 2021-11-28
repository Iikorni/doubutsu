defmodule Doubutsu.Repo.Migrations.CreateShops do
  use Ecto.Migration

  def change do
    create table(:shops) do
      add :name, :string
      add :keeper_image, :string
      add :description, :text

      timestamps()
    end

  end
end
