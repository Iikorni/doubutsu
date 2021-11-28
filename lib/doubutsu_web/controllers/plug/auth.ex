defmodule DoubutsuWeb.Auth do
  import Plug.Conn

  def init(opts) do
    Keyword.fetch!(opts, :repo)
  end

  def call(conn, _repo) do
    user_id = get_session(conn, :user_id)
    user = user_id && Doubutsu.Accounts.get_user!(user_id)
    assign(conn, :current_user, user)
  end

  def login(conn, user) do
    conn
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)
    |> configure_session(renew: true)
  end

  def logout(conn) do
    configure_session(conn, drop: true)
  end

  def login_with_user_pass(conn, username, password, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(Doubutsu.Accounts.User, username: username)

    cond do
      user && Doubutsu.Accounts.Hashing.validate_password(Ecto.assoc(user, :credential) |> Doubutsu.Repo.one, password) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        Doubutsu.Accounts.Hashing.dummy_checkpw()
        {:error, :not_found, conn}
    end
  end
end
