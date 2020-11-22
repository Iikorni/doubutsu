defmodule Doubutsu.Accounts.Hashing do

  def hash_password(password) do
    Argon2.hash_pwd_salt(password)
  end

  def validate_password(%Credential{} = credential, password) do
    Argon2.check_pass(credential, password)
  end
end
