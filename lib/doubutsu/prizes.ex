defmodule Doubutsu.Prizes do
  @moduledoc """
  The Prizes context.
  """

  import Ecto.Query, warn: false
  alias Doubutsu.Repo

  alias Doubutsu.Prizes.PrizePool

  @doc """
  Returns the list of prize_pools.

  ## Examples

      iex> list_prize_pools()
      [%PrizePool{}, ...]

  """
  def list_prize_pools do
    Repo.all(PrizePool)
  end

  @doc """
  Gets a single prize_pool.

  Raises `Ecto.NoResultsError` if the Prize pool does not exist.

  ## Examples

      iex> get_prize_pool!(123)
      %PrizePool{}

      iex> get_prize_pool!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prize_pool!(id), do: Repo.get!(PrizePool, id)

  @doc """
  Creates a prize_pool.

  ## Examples

      iex> create_prize_pool(%{field: value})
      {:ok, %PrizePool{}}

      iex> create_prize_pool(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prize_pool(attrs \\ %{}) do
    %PrizePool{}
    |> PrizePool.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prize_pool.

  ## Examples

      iex> update_prize_pool(prize_pool, %{field: new_value})
      {:ok, %PrizePool{}}

      iex> update_prize_pool(prize_pool, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prize_pool(%PrizePool{} = prize_pool, attrs) do
    prize_pool
    |> PrizePool.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prize_pool.

  ## Examples

      iex> delete_prize_pool(prize_pool)
      {:ok, %PrizePool{}}

      iex> delete_prize_pool(prize_pool)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prize_pool(%PrizePool{} = prize_pool) do
    Repo.delete(prize_pool)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prize_pool changes.

  ## Examples

      iex> change_prize_pool(prize_pool)
      %Ecto.Changeset{data: %PrizePool{}}

  """
  def change_prize_pool(%PrizePool{} = prize_pool, attrs \\ %{}) do
    PrizePool.changeset(prize_pool, attrs)
  end
end
