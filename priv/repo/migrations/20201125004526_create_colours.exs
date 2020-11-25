defmodule Doubutsu.Repo.Migrations.CreateColours do
  use Ecto.Migration

  def change do
    create table(:colours) do
      add :slug, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:colours, [:slug])
  end
end
