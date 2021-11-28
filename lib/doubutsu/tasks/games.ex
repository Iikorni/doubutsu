defmodule Doubutsu.Tasks.Games do

  def clear_daily_locks() do
    Doubutsu.Games.list_daily_lock_types()
    |> Enum.reduce([], fn type, lst ->
      Doubutsu.Games.get_all_locked_daily_locks_for_type(type) ++ lst
    end)
    |> Enum.reduce(Ecto.Multi.new(), fn lock, multi ->
      try_clear_lock(multi, lock)
    end)
    |> Doubutsu.Repo.transaction()
  end

  def clear_game_locks() do
    Doubutsu.Games.list_non_daily_lock_types()
    |> Enum.reduce([], fn type, lst ->
      Doubutsu.Games.get_all_finished_locks_for_type(type) ++ lst
    end)
    |> Enum.reduce(Ecto.Multi.new(), fn lock, multi ->
      try_clear_lock(multi, lock)
    end)
    |> Doubutsu.Repo.transaction()
  end

  def try_clear_lock(multi, lock) do
    multi
    |> Ecto.Multi.update({:lock, lock.id}, clear_lock_changeset(lock))
  end

  def clear_lock_changeset(lock) do
    Doubutsu.Games.change_game_lock(lock)
    |> Ecto.Changeset.put_change(:count, 0)
  end
end
