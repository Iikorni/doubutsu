defmodule Doubutsu.Pets.Owner do
  use Ecto.Schema
  import Ecto.Changeset

  schema "owners" do
    belongs_to :user, Doubutsu.Accounts.User

    belongs_to :active_pet, Doubutsu.Pets.Pet

    has_many :pets, Doubutsu.Pets.Pet

    timestamps()
  end

  @doc false
  def changeset(owner, attrs) do
    owner
    |> cast(attrs, [])
    |> validate_required([])
  end
end
