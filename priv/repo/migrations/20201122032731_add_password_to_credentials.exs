defmodule Doubutsu.Repo.Migrations.AddPasswordToCredentials do
  use Ecto.Migration

  def change do
    alter table(:credentials) do
      add :encrypted_password, :string
    end
  end
end
