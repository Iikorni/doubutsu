defmodule Doubutsu.Repo.Migrations.AddNameUniqueIndexToTypes do
  use Ecto.Migration

  def change do
    create unique_index(:types, [:name])
  end
end
