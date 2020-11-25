defmodule Doubutsu.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Doubutsu.Accounts.Credential

  schema "users" do
    field :name, :string
    field :username, :string
    field :role, :integer
    has_one :credential, Credential
    has_one :inventory, Doubutsu.Things.Inventory
    has_one :owner, Doubutsu.Pets.Owner

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username])
    |> validate_required([:name, :username])
    |> unique_constraint(:username)
  end
end
