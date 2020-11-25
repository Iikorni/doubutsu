# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Doubutsu.Repo.insert!(%Doubutsu.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Food"})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Book"})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Potion"})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Gift"})

Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "cat", name: "Neko", plural: "Nekos", description: "Nekos are fun-loving creatures, dedicated to enjoying life as much as they can, whether that be basking in the sun, playing with toys, or taking long naps."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "skookum", name: "Skookum", plural: "Skookums", description: "Skookums are creatures seemingly from your worst nightmares, but in reality they are kind, gentle folk, who only want to be treated with love and care."})

Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "blue", name: "Blue"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "red", name: "Red"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "yellow", name: "Yellow"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "green", name: "Green"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "pink", name: "Pink"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "purple", name: "Purple"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "grey", name: "Grey"})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 7})
