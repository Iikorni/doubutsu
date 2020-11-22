defmodule Doubutsu.Repo do
  use Ecto.Repo,
    otp_app: :doubutsu,
    adapter: Ecto.Adapters.Postgres
end
