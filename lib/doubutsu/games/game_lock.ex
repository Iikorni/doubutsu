defmodule Doubutsu.Games.GameLock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "game_locks" do
    field :count, :integer
    field :last_lock_time, :naive_datetime

    belongs_to :user, Doubutsu.Accounts.User
    belongs_to :game_lock_type, Doubutsu.Games.GameLockType

    timestamps()
  end

  @doc false
  def changeset(game_lock, attrs) do
    game_lock
    |> cast(attrs, [:count])
    |> validate_required([])
  end
end
