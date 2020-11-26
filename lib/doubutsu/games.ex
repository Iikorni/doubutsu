defmodule Doubutsu.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias Doubutsu.Repo

  alias Doubutsu.Games.ScratchType

  @doc """
  Returns the list of scratch_types.

  ## Examples

      iex> list_scratch_types()
      [%ScratchType{}, ...]

  """
  def list_scratch_types do
    ScratchType
    |> Repo.all()
    |> Repo.preload(:item)
  end

  @doc """
  Gets a single scratch_type.

  Raises `Ecto.NoResultsError` if the Scratch type does not exist.

  ## Examples

      iex> get_scratch_type!(123)
      %ScratchType{}

      iex> get_scratch_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_scratch_type!(id), do: Repo.get!(ScratchType, id)

  @doc """
  Creates a scratch_type.

  ## Examples

      iex> create_scratch_type(%{field: value})
      {:ok, %ScratchType{}}

      iex> create_scratch_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_scratch_type(attrs \\ %{}) do
    %ScratchType{}
    |> ScratchType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a scratch_type.

  ## Examples

      iex> update_scratch_type(scratch_type, %{field: new_value})
      {:ok, %ScratchType{}}

      iex> update_scratch_type(scratch_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_scratch_type(%ScratchType{} = scratch_type, attrs) do
    scratch_type
    |> ScratchType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a scratch_type.

  ## Examples

      iex> delete_scratch_type(scratch_type)
      {:ok, %ScratchType{}}

      iex> delete_scratch_type(scratch_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_scratch_type(%ScratchType{} = scratch_type) do
    Repo.delete(scratch_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking scratch_type changes.

  ## Examples

      iex> change_scratch_type(scratch_type)
      %Ecto.Changeset{data: %ScratchType{}}

  """
  def change_scratch_type(%ScratchType{} = scratch_type, attrs \\ %{}) do
    ScratchType.changeset(scratch_type, attrs)
  end

  alias Doubutsu.Games.ScratchPrize

  @doc """
  Returns the list of scratch_prizes.

  ## Examples

      iex> list_scratch_prizes()
      [%ScratchPrize{}, ...]

  """
  def list_scratch_prizes do
    Repo.all(ScratchPrize)
  end

  @doc """
  Gets a single scratch_prize.

  Raises `Ecto.NoResultsError` if the Scratch prize does not exist.

  ## Examples

      iex> get_scratch_prize!(123)
      %ScratchPrize{}

      iex> get_scratch_prize!(456)
      ** (Ecto.NoResultsError)

  """
  def get_scratch_prize!(id), do: Repo.get!(ScratchPrize, id)

  @doc """
  Creates a scratch_prize.

  ## Examples

      iex> create_scratch_prize(%{field: value})
      {:ok, %ScratchPrize{}}

      iex> create_scratch_prize(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_scratch_prize(attrs \\ %{}) do
    %ScratchPrize{}
    |> ScratchPrize.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a scratch_prize.

  ## Examples

      iex> update_scratch_prize(scratch_prize, %{field: new_value})
      {:ok, %ScratchPrize{}}

      iex> update_scratch_prize(scratch_prize, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_scratch_prize(%ScratchPrize{} = scratch_prize, attrs) do
    scratch_prize
    |> ScratchPrize.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a scratch_prize.

  ## Examples

      iex> delete_scratch_prize(scratch_prize)
      {:ok, %ScratchPrize{}}

      iex> delete_scratch_prize(scratch_prize)
      {:error, %Ecto.Changeset{}}

  """
  def delete_scratch_prize(%ScratchPrize{} = scratch_prize) do
    Repo.delete(scratch_prize)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking scratch_prize changes.

  ## Examples

      iex> change_scratch_prize(scratch_prize)
      %Ecto.Changeset{data: %ScratchPrize{}}

  """
  def change_scratch_prize(%ScratchPrize{} = scratch_prize, attrs \\ %{}) do
    ScratchPrize.changeset(scratch_prize, attrs)
  end
end
