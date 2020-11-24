defmodule Doubutsu.Repo.Migrations.CreateInstances do
  use Ecto.Migration

  def change do
    create table(:instances) do
      add :item_id, references(:items, on_delete: :delete_all)
      add :inventory_id, references(:inventories, on_delete: :delete_all)

      timestamps()
    end

    create index(:instances, [:item_id])
    create index(:instances, [:inventory_id])
  end
end
