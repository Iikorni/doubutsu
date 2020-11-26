defmodule Doubutsu.Repo.Migrations.CreateScratchTypes do
  use Ecto.Migration

  def change do
    create table(:scratch_types) do
      add :slug, :string
      add :name, :string
      add :item_id, references(:items, on_delete: :nilify_all)

      timestamps()
    end

    create unique_index(:scratch_types, [:slug])
    create unique_index(:scratch_types, [:item_id])
  end
end
