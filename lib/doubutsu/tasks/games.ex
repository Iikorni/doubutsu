defmodule Doubutsu.Tasks.Games do

  def try_clear_lock(multi, lock) do
    if lock.count > 0 do
      lock_type = lock.game_lock_type
      if Doubutsu.Games.lock_needs_updating(lock, lock_type) do
        changeset = Ecto.Changeset.put_change(Doubutsu.Games.change_game_lock(lock), :count, 0)
        Ecto.Multi.update(multi, {:lock, lock.id}, changeset)
      else
        multi
      end
    else
      multi
    end
  end

  def clear_game_locks() do
    locks = Doubutsu.Games.list_game_locks()

    Doubutsu.Repo.transaction(
      Enum.reduce(locks, Ecto.Multi.new(), fn lock, multi ->
        try_clear_lock(multi, lock)
      end)
      )
  end
end
