defmodule Doubutsu.Tasks.Games do

  def try_clear_lock(multi, lock) do
    Ecto.Multi.update(multi, {:lock, lock.id},
      Ecto.Changeset.put_change(Doubutsu.Games.change_game_lock(lock), :count, 0))
  end

  def clear_game_locks() do
    lock_types = Doubutsu.Games.list_game_lock_types()

    locks = Enum.reduce(lock_types, [], fn type, lst ->
      Doubutsu.Games.get_all_finished_locks_for_type(type) ++ lst
    end)

    Doubutsu.Repo.transaction(
      Enum.reduce(locks, Ecto.Multi.new(), fn lock, multi ->
        try_clear_lock(multi, lock)
      end))
  end
end
