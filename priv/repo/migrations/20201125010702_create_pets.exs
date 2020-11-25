defmodule Doubutsu.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :gender, :string
      add :level, :integer
      add :health, :integer
      add :hunger, :string
      add :strength, :integer
      add :defense, :integer
      add :agility, :integer
      add :intellect, :integer
      add :owner_id, references(:owners, on_delete: :delete_all)
      add :breed_id, references(:breeds, on_delete: :nothing)
      add :colour_id, references(:colours, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:pets, [:name])
    create index(:pets, [:breed_id])
    create index(:pets, [:colour_id])
  end
end
