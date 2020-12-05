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

Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Food", functional_type: :food})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Book", functional_type: :book})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Potion", functional_type: :potion})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Gift", functional_type: :gift})
Doubutsu.Repo.insert!(%Doubutsu.Things.Type{name: "Paintbrush", functional_type: :paintbrush})

Doubutsu.Repo.insert!(%Doubutsu.Games.ScratchType{slug: "dd", name: "Destiny Dosh"})
Doubutsu.Repo.insert!(%Doubutsu.Games.ScratchType{slug: "ff", name: "Fortunate Fireworks"})
Doubutsu.Repo.insert!(%Doubutsu.Games.ScratchType{slug: "ss", name: "Serendipitous Scales"})
Doubutsu.Repo.insert!(%Doubutsu.Games.ScratchType{slug: "kk", name: "Karma Kash"})

Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "cat", name: "Neko", plural: "Nekos", description: "Nekos are fun-loving creatures, dedicated to enjoying life as much as they can, whether that be basking in the sun, playing with toys, or taking long naps."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "skookum", name: "Skookum", plural: "Skookums", description: "Skookums are creatures seemingly from your worst nightmares, but in reality they are kind, gentle folk, who only want to be treated with love and care."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "flutter", name: "Flutterby", plural: "Flutterbys", description: "Flutterbys are creatures of the sky, rejoicing in wide open spaces to zip and zoom all across. Energetic and always full of spunk, these critters never tire."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "dino", name: "Dyno", plural: "Dynos", description: "Dynos are, despite their somewhat fearsome appearance, kind and gentle (not to mention herbivorous) creatures. They frolic amongst tall trees, and enjoy spaces where they won't hit their head."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "fish", name: "Angeel", plural: "Angeels", description: "Angeels look fairly tough, and they might sound tough too - but never fear, as these fearsome looking fish have a capacity for a great deal of love, given the right owner."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "lizard", name: "Lizz", plural: "Lizz", description: "Lizz are quiet but friendly, enjoying tall, mountainous areas that they can climb and glide from. Their wings, attached to their arms, are a point of pride for them."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "bird", name: "Chirpii", plural: "Chirpiis", description: "Chirpiis are a songful group, full of music and elegance as they swoop up and down the daytime sky, whistling a cheery tune all the while."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "cow", name: "Ko", plural: "Ko", description: "Ko are serene, peaceful creatures, preferring a day spent grazing and reading rather than battling and running. A quiet environment full of food and gentle entertainment is ideal for these lovely pets."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "tam", name: "Tamma", plural: "Tammas", description: "Tammas are sly, cunning creatures, with an eye and ear out for potential opportunity everywhere. They use whatever means they can to help those around them, and to give everybody a chance."})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Breed{slug: "bear", name: "Borja", plural: "Borjas", description: "Borjas are the slow eaters of the Doubutsu kingdom - they like to take their time with everything they do, but in exchange the quality time you spend with them is multiplied tenfold."})

Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "blue", name: "Blue"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "red", name: "Red"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "yellow", name: "Yellow"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "green", name: "Green"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "pink", name: "Pink"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "purple", name: "Purple"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "grey", name: "Grey"})
Doubutsu.Repo.insert!(%Doubutsu.Pets.Colour{slug: "rainbow", name: "Rainbow"})

Doubutsu.Repo.insert!(%Doubutsu.Games.GameLock{name: "scratchcard", max_count: 1, description: "Lock for scratchcard purchases"})
Doubutsu.Repo.insert!(%Doubutsu.Games.GameLock{name: "prize_wheel", max_count: 1, description: "Prize wheel's 2-hour timer"})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 7})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 1, colour_id: 8})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 2, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 3, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 7})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 4, colour_id: 8})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 5, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 6, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 7, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 8, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 9, colour_id: 7})

Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 1})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 2})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 3})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 4})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 5})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 6})
Doubutsu.Repo.insert!(%Doubutsu.Pets.BreedColour{breed_id: 10, colour_id: 7})
