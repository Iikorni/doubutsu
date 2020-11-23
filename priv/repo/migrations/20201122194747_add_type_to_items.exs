defmodule Doubutsu.Repo.Migrations.AddTypeToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :type_id, references(:types, on_delete: :nothing), null: false
    end
  end
end
