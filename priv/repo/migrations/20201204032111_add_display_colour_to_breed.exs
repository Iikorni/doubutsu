defmodule Doubutsu.Repo.Migrations.AddDisplayColourToBreed do
  use Ecto.Migration

  def change do
    alter table(:breeds) do
      add :display_colour_id, references(:colours, on_delete: :nilify_all)
    end
  end
end
