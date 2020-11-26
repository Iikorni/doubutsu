defmodule Doubutsu.Repo.Migrations.AddFunctionalTypeToTypes do
  use Ecto.Migration

  def change do
    alter table(:types) do
      add :functional_type, :string, default: "nothing"
    end
  end
end
