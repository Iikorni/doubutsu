defmodule Doubutsu.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :money, :integer, default: 100
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:inventories, [:user_id])
  end
end
