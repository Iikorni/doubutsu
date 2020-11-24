defmodule Doubutsu.Util do
  def gen_token(length \\ 32) do
    :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
  end
end
