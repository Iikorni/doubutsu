defmodule Doubutsu.Repo.Migrations.CreateInventories do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :money, :integer
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create index(:inventories, [:user_id])
  end
end
