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
  def get_prize_pool!(id) do
    from(p in PrizePool,
      where: p.id == ^id,
      preload: [prizes: [:item]])
    |> Repo.one!()
  end

  def get_prize_pool_by_name!(name) do
    from(p in PrizePool,
      where: p.name == ^name,
      preload: [prizes: [:item]])
    |> Repo.one!()
  end

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

  def weighted_selection([{choice, weight} | _tail], idx) when idx < weight, do: choice
  def weighted_selection([{_, weight} | tail], idx), do: weighted_selection(tail, idx - weight)

  def get_prize_from_prize_pool(prize_pool) do
    case prize_pool.prizes do
      [] ->
        {:none, nil}
      pairs ->
        sum = Enum.reduce(pairs, 0, fn(prize, a) -> prize.weight + a end)
        weight_pairs = Enum.map(pairs, &{&1, &1.weight})
        pos = :rand.uniform(sum)-1
        IO.puts(pos)
        {:ok, weighted_selection(weight_pairs, pos)}
    end
  end

  alias Doubutsu.Prizes.Prize

  @doc """
  Returns the list of prizes.

  ## Examples

      iex> list_prizes()
      [%Prize{}, ...]

  """
  def list_prizes do
    Repo.all(Prize)
  end

  @doc """
  Gets a single prize.

  Raises `Ecto.NoResultsError` if the Prize does not exist.

  ## Examples

      iex> get_prize!(123)
      %Prize{}

      iex> get_prize!(456)
      ** (Ecto.NoResultsError)

  """
  def get_prize!(id) do
    from(p in Prize,
      where: p.id == ^id,
      preload: :prize_pool)
    |> Repo.one!()
  end

  @doc """
  Creates a prize.

  ## Examples

      iex> create_prize(%{field: value})
      {:ok, %Prize{}}

      iex> create_prize(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_prize(attrs \\ %{}) do
    %Prize{}
    |> Prize.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a prize.

  ## Examples

      iex> update_prize(prize, %{field: new_value})
      {:ok, %Prize{}}

      iex> update_prize(prize, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_prize(%Prize{} = prize, attrs) do
    prize
    |> Prize.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a prize.

  ## Examples

      iex> delete_prize(prize)
      {:ok, %Prize{}}

      iex> delete_prize(prize)
      {:error, %Ecto.Changeset{}}

  """
  def delete_prize(%Prize{} = prize) do
    Repo.delete(prize)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking prize changes.

  ## Examples

      iex> change_prize(prize)
      %Ecto.Changeset{data: %Prize{}}

  """
  def change_prize(%Prize{} = prize, attrs \\ %{}) do
    Prize.changeset(prize, attrs)
  end
end
