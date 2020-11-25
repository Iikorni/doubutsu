defmodule Doubutsu.Repo.Migrations.CreateBreeds do
  use Ecto.Migration

  def change do
    create table(:breeds) do
      add :slug, :string
      add :name, :string
      add :plural, :string
      add :description, :text

      timestamps()
    end

    create unique_index(:breeds, [:slug])
  end
end
