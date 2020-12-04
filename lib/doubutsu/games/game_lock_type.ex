defmodule Doubutsu.Games.GameLockType do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_lock_types" do
    field :description, :string
    field :max_count, :integer
    field :name, :string
    field :lock_duration, :integer

    has_many :game_locks, Doubutsu.Games.GameLock

    timestamps()
  end

  @doc false
  def changeset(game_lock_type, attrs) do
    game_lock_type
    |> cast(attrs, [:name, :description, :max_count])
    |> validate_required([:name, :description, :max_count])
  end
end
