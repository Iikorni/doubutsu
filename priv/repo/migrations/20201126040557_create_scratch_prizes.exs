defmodule Doubutsu.Repo.Migrations.CreateScratchPrizes do
  use Ecto.Migration

  def change do
    create table(:scratch_prizes) do
      add :slug, :string
      add :type, :string
      add :data, :string
      add :scratch_type_id, references(:scratch_types, on_delete: :nothing)

      timestamps()
    end

    create unique_index(:scratch_prizes, [:slug])
    create index(:scratch_prizes, [:scratch_type_id])
  end
end
