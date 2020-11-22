defmodule Doubutsu.Accounts.Credential do
  use Ecto.Schema
  import Ecto.Changeset

  alias Doubutsu.Accounts.{User, Hashing}

  schema "credentials" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(credential, attrs) do
    credential
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> encrypt_password
    |> downcase_username
  end

  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)
    put_change(changeset, :encrypted_password, Hashing.hash_password(password))
  end

  defp downcase_username(changeset) do
    update_change(changeset, :username, &String.downcase/1)
  end
end
