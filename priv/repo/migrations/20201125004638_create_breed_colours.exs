defmodule Doubutsu.Repo.Migrations.CreateBreedColours do
  use Ecto.Migration

  def change do
    create table(:breed_colours) do
      add :breed_id, references(:breeds, on_delete: :delete_all)
      add :colour_id, references(:colours, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:breed_colours, [:breed_id, :colour_id])
  end
end
