defmodule Doubutsu.Accounts.Hashing do

  alias Doubutsu.Accounts.Credential

  def hash_password(password) do
    Argon2.hash_pwd_salt(password)
  end

  def validate_password(%Credential{} = credential, password) do
    Argon2.verify_pass(password, credential.encrypted_password)
  end

  def dummy_checkpw() do
    Argon2.no_user_verify()
  end
end
