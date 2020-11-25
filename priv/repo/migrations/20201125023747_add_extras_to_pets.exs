defmodule Doubutsu.Repo.Migrations.AddExtrasToPets do
  use Ecto.Migration

  def change do
    alter table(:pets) do
      modify :level, :integer, default: 1
      modify :health, :integer, default: 10
      add :max_health, :integer, default: 10
      modify :hunger, :string, default: "satiated"
      add :last_hunger_tick, :naive_datetime
      modify :strength, :integer, default: 10
      modify :defense, :integer, default: 10
      modify :agility, :integer, default: 10
      modify :intellect, :integer, default: 10
    end
  end
end
