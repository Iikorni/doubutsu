defmodule Doubutsu.Repo.Migrations.CreatePrizes do
  use Ecto.Migration

  def change do
    create table(:prizes) do
      add :weight, :integer
      add :item_id, references(:items, on_delete: :delete_all)
      add :prize_pool_id, references(:prize_pools, on_delete: :delete_all)

      timestamps()
    end

    create index(:prizes, [:item_id])
    create index(:prizes, [:prize_pool_id])
  end
end
