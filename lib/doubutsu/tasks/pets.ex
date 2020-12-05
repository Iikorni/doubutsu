defmodule Doubutsu.Tasks.Pets do
  def hunger_tick do
    hunger_values = Ecto.Enum.values(Doubutsu.Pets.Pet, :hunger)
    Doubutsu.Pets.list_all_pets_for_hunger()
    |> Enum.reduce(Ecto.Multi.new(), fn pet, multi ->
          hunger_index = Enum.find_index(hunger_values, fn l -> pet.hunger == l end)
          if hunger_index == 0 do
            raise "bad hunger value #{pet.hunger}"
          end
          tick_hunger_for_pet(multi, pet, Enum.at(hunger_values, hunger_index - 1))
        end)
    |> Doubutsu.Repo.transaction()
  end

  def tick_hunger_for_pet(multi, pet, hunger) do
    Ecto.Multi.update(multi,
      {:pet, pet.id},
      hunger_changeset(pet, hunger))
  end

  def hunger_changeset(pet, hunger) do
    Doubutsu.Pets.change_pet(pet)
    |> Ecto.Changeset.put_change(:hunger, hunger)
  end
end
