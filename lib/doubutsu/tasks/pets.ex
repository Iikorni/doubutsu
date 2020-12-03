defmodule Doubutsu.Tasks.Pets do
  def hunger_tick do
    Doubutsu.Repo.transaction(hunger_multi())
  end

  def hunger_multi() do
    pets = Doubutsu.Pets.list_pets()
    hunger_values = Ecto.Enum.values(Doubutsu.Pets.Pet, :hunger)
    Enum.reduce(pets, Ecto.Multi.new(), fn pet, multi ->
      hunger_index = Enum.find_index(hunger_values, fn l -> pet.hunger == l end)
      if hunger_index > 0 do
        Ecto.Multi.update(
          multi,
          {:pet, pet.id},
          hunger_changeset(pet, Enum.at(hunger_values, hunger_index - 1))
        )
      else
        multi
      end
    end)
  end

  def hunger_changeset(pet, hunger) do
    Doubutsu.Pets.change_pet(pet)
    |> Ecto.Changeset.put_change(:hunger, hunger)
  end
end
