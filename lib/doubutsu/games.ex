defmodule Doubutsu.Games do
  @moduledoc """
  The Games context.
  """

  import Ecto.Query, warn: false
  alias Doubutsu.Repo

  alias Doubutsu.Games.ScratchType
  alias Doubutsu.Games.ScratchPrize
  alias Doubutsu.Games.GameLock
  alias Doubutsu.Games.GameLockType

  @doc """
  Returns the list of scratch_types.

  ## Examples

      iex> list_scratch_types()
      [%ScratchType{}, ...]

  """
  def list_scratch_types do
    from(ScratchType,
      preload: :item)
    |> Repo.all()
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

  def get_scratch_type_by_slug(slug) do
    from(s in ScratchType,
      where: s.slug == ^slug,
      preload: :item)
    |> Repo.one()
    |> case do
      nil -> {:error, nil}
      scratch_type -> {:ok, scratch_type}
    end
  end

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


  @doc """
  Returns the list of game_lock_types.

  ## Examples

      iex> list_game_lock_types()
      [%GameLockType{}, ...]

  """
  def list_game_lock_types do
    Repo.all(GameLockType)
  end

  def list_non_daily_lock_types do
    from(lock_type in GameLockType,
          where: lock_type.is_daily == false)
    |> Repo.all()
  end

  def list_daily_lock_types do
    from(lock_type in GameLockType,
          where: lock_type.is_daily == true)
    |> Repo.all()
  end

  @doc """
  Gets a single game_lock_type.

  Raises `Ecto.NoResultsError` if the Game lock type does not exist.

  ## Examples

      iex> get_game_lock_type!(123)
      %GameLockType{}

      iex> get_game_lock_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_lock_type!(id), do: Repo.get!(GameLockType, id)

  def get_game_lock_type_by_name!(name) do
    lock_type = Repo.one(from lock_type in GameLockType, where: lock_type.name == ^name)
    if lock_type == nil do
      raise "bad (unknown) lock type #{name}"
    end
    lock_type
  end

  @doc """
  Creates a game_lock_type.

  ## Examples

      iex> create_game_lock_type(%{field: value})
      {:ok, %GameLockType{}}

      iex> create_game_lock_type(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_lock_type(attrs \\ %{}) do
    %GameLockType{}
    |> GameLockType.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_lock_type.

  ## Examples

      iex> update_game_lock_type(game_lock_type, %{field: new_value})
      {:ok, %GameLockType{}}

      iex> update_game_lock_type(game_lock_type, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_lock_type(%GameLockType{} = game_lock_type, attrs) do
    game_lock_type
    |> GameLockType.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_lock_type.

  ## Examples

      iex> delete_game_lock_type(game_lock_type)
      {:ok, %GameLockType{}}

      iex> delete_game_lock_type(game_lock_type)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_lock_type(%GameLockType{} = game_lock_type) do
    Repo.delete(game_lock_type)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_lock_type changes.

  ## Examples

      iex> change_game_lock_type(game_lock_type)
      %Ecto.Changeset{data: %GameLockType{}}

  """
  def change_game_lock_type(%GameLockType{} = game_lock_type, attrs \\ %{}) do
    GameLockType.changeset(game_lock_type, attrs)
  end

  @doc """
  Returns the list of game_lock.

  ## Examples

      iex> list_game_locks()
      [%GameLocks{}, ...]

  """
  def list_game_locks do
    from(GameLock,
      preload: :game_lock_type)
    |> Repo.all()
  end

  @doc """
  Gets a single game_lock.

  Raises `Ecto.NoResultsError` if the Game locks does not exist.

  ## Examples

      iex> get_game_lock!(123)
      %GameLock{}

      iex> get_game_lock!(456)
      ** (Ecto.NoResultsError)

  """
  def get_game_lock!(id), do: Repo.get!(GameLock, id)

  @doc """
  Creates a game_lock.

  ## Examples

      iex> create_game_lock(%{field: value})
      {:ok, %GameLocks{}}

      iex> create_game_lock(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_game_lock(attrs \\ %{}) do
    %GameLock{}
    |> GameLock.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a game_lock.

  ## Examples

      iex> update_game_lock(game_lock, %{field: new_value})
      {:ok, %GameLocks{}}

      iex> update_game_lock(game_lock, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_game_lock(%GameLock{} = game_lock, attrs) do
    game_lock
    |> GameLock.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a game_lock.

  ## Examples

      iex> delete_game_lock(game_lock)
      {:ok, %GameLocks{}}

      iex> delete_game_lock(game_lock)
      {:error, %Ecto.Changeset{}}

  """
  def delete_game_lock(%GameLock{} = game_lock) do
    Repo.delete(game_lock)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking game_lock changes.

  ## Examples

      iex> change_game_lock(game_lock)
      %Ecto.Changeset{data: %GameLocks{}}

  """
  def change_game_lock(%GameLock{} = game_lock, attrs \\ %{}) do
    GameLock.changeset(game_lock, attrs)
  end

  def lock_needs_updating?(lock, lock_type) do
    NaiveDateTime.diff(NaiveDateTime.local_now(), lock.last_lock_time) >= lock_type.lock_duration
  end

  def get_all_finished_locks_for_type(lock_type) do
    from(l in GameLock,
          where: l.count > 0,
          where: l.last_lock_time <= ^NaiveDateTime.add(NaiveDateTime.local_now(), -lock_type.lock_duration),
          where: l.game_lock_type_id == ^lock_type.id)
    |> Repo.all()
  end

  def get_all_locked_daily_locks_for_type(lock_type) do
    from(l in GameLock,
          where: l.count > 0,
          where: l.game_lock_type_id == ^lock_type.id)
    |> Repo.all()
  end

  def game_locked?(name, user) do
    lock_type = get_game_lock_type_by_name!(name)

    lock =
      from(lock in GameLock,
        where: lock.user_id == ^user.id,
        where: lock.game_lock_type_id == ^lock_type.id
      )
      |> Repo.one!

    lock && lock_type.max_count <= lock.count
  end

  def try_increment_lock(name, user) do
    lock_type = get_game_lock_type_by_name!(name)

    lock = Repo.one(from(
      lock in GameLock,
      where: lock.user_id == ^user.id,
      where: lock.game_lock_type_id == ^lock_type.id
      ))

    if lock == nil do
      change_game_lock(%GameLock{})
      |> Ecto.Changeset.put_change(:user_id, user.id)
      |> Ecto.Changeset.put_change(:game_lock_type_id, lock_type.id)
      |> Ecto.Changeset.put_change(:count, 1)
      |> Ecto.Changeset.put_change(:last_lock_time, NaiveDateTime.local_now())
      |> Repo.insert!()
      :ok
    else
      if lock_type.max_count <= lock.count do
        :error
      else
        change_game_lock(lock)
        |> Ecto.Changeset.put_change(:count, lock.count + 1)
        |> Ecto.Changeset.put_change(:last_lock_time, if lock.count == 0 do NaiveDateTime.local_now() else lock.last_lock_time end)
        |> Repo.update!()
        :ok
      end
    end
  end
end
