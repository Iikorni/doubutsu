defmodule Doubutsu.Repo.Migrations.AddActivePetToOwners do
  use Ecto.Migration

  def change do
    alter table(:owners) do
      add :active_pet_id, references(:pets, on_delete: :nothing)
    end
  end
end
