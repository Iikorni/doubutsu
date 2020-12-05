defmodule DoubutsuWeb.PurchaseToken do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    token = Doubutsu.Util.gen_token()
    conn
    |> put_session(:purchase_token, token)
    |> assign(:token, token)
  end
end
