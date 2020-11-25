defmodule Doubutsu.Repo.Migrations.CreateOwners do
  use Ecto.Migration

  def change do
    create table(:owners) do
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:owners, [:user_id])
  end
end
