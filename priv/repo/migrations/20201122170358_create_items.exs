defmodule Doubutsu.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string
      add :description, :text
      add :weight, :integer
      add :price, :integer
      add :rarity, :integer
      add :picture, :string
      add :no_trade, :boolean, default: false, null: false

      timestamps()
    end

  end
end
