defmodule Doubutsu.Prizes.PrizePool do
  use Ecto.Schema
  import Ecto.Changeset

  schema "prize_pools" do
    field :description, :string
    field :name, :string

    has_many :prizes, Doubutsu.Prizes.Prize

    timestamps()
  end

  @doc false
  def changeset(prize_pool, attrs) do
    prize_pool
    |> cast(attrs, [:name, :description])
    |> validate_required([:name, :description])
  end
end
