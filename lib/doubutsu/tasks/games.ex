defmodule Doubutsu.Tasks.Games do

  def try_clear_lock(lock) do
    if lock.count > 0 do
      lock_type = lock.game_lock_type
      lock_duration = lock_type.lock_duration
      last_lock_time = lock.last_lock_time
      if NaiveDateTime.diff(NaiveDateTime.local_now(), last_lock_time) >= lock_duration do
        Doubutsu.Games.change_game_lock(lock)
        |> Ecto.Changeset.put_change(:count, 0)
        |> Doubutsu.Repo.update!()
      end
    end
  end

  def clear_game_locks() do
    locks = Doubutsu.Games.list_game_locks()
    for lock <- locks do
      try_clear_lock(lock)
    end
  end
end
