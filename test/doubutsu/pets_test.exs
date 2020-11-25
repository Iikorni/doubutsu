defmodule Doubutsu.PetsTest do
  use Doubutsu.DataCase

  alias Doubutsu.Pets

  describe "breeds" do
    alias Doubutsu.Pets.Breed

    @valid_attrs %{description: "some description", name: "some name", plural: "some plural", slug: "some slug"}
    @update_attrs %{description: "some updated description", name: "some updated name", plural: "some updated plural", slug: "some updated slug"}
    @invalid_attrs %{description: nil, name: nil, plural: nil, slug: nil}

    def breed_fixture(attrs \\ %{}) do
      {:ok, breed} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_breed()

      breed
    end

    test "list_breeds/0 returns all breeds" do
      breed = breed_fixture()
      assert Pets.list_breeds() == [breed]
    end

    test "get_breed!/1 returns the breed with given id" do
      breed = breed_fixture()
      assert Pets.get_breed!(breed.id) == breed
    end

    test "create_breed/1 with valid data creates a breed" do
      assert {:ok, %Breed{} = breed} = Pets.create_breed(@valid_attrs)
      assert breed.description == "some description"
      assert breed.name == "some name"
      assert breed.plural == "some plural"
      assert breed.slug == "some slug"
    end

    test "create_breed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_breed(@invalid_attrs)
    end

    test "update_breed/2 with valid data updates the breed" do
      breed = breed_fixture()
      assert {:ok, %Breed{} = breed} = Pets.update_breed(breed, @update_attrs)
      assert breed.description == "some updated description"
      assert breed.name == "some updated name"
      assert breed.plural == "some updated plural"
      assert breed.slug == "some updated slug"
    end

    test "update_breed/2 with invalid data returns error changeset" do
      breed = breed_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_breed(breed, @invalid_attrs)
      assert breed == Pets.get_breed!(breed.id)
    end

    test "delete_breed/1 deletes the breed" do
      breed = breed_fixture()
      assert {:ok, %Breed{}} = Pets.delete_breed(breed)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_breed!(breed.id) end
    end

    test "change_breed/1 returns a breed changeset" do
      breed = breed_fixture()
      assert %Ecto.Changeset{} = Pets.change_breed(breed)
    end
  end

  describe "colours" do
    alias Doubutsu.Pets.Colour

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def colour_fixture(attrs \\ %{}) do
      {:ok, colour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_colour()

      colour
    end

    test "list_colours/0 returns all colours" do
      colour = colour_fixture()
      assert Pets.list_colours() == [colour]
    end

    test "get_colour!/1 returns the colour with given id" do
      colour = colour_fixture()
      assert Pets.get_colour!(colour.id) == colour
    end

    test "create_colour/1 with valid data creates a colour" do
      assert {:ok, %Colour{} = colour} = Pets.create_colour(@valid_attrs)
      assert colour.name == "some name"
      assert colour.slug == "some slug"
    end

    test "create_colour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_colour(@invalid_attrs)
    end

    test "update_colour/2 with valid data updates the colour" do
      colour = colour_fixture()
      assert {:ok, %Colour{} = colour} = Pets.update_colour(colour, @update_attrs)
      assert colour.name == "some updated name"
      assert colour.slug == "some updated slug"
    end

    test "update_colour/2 with invalid data returns error changeset" do
      colour = colour_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_colour(colour, @invalid_attrs)
      assert colour == Pets.get_colour!(colour.id)
    end

    test "delete_colour/1 deletes the colour" do
      colour = colour_fixture()
      assert {:ok, %Colour{}} = Pets.delete_colour(colour)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_colour!(colour.id) end
    end

    test "change_colour/1 returns a colour changeset" do
      colour = colour_fixture()
      assert %Ecto.Changeset{} = Pets.change_colour(colour)
    end
  end

  describe "breed_colours" do
    alias Doubutsu.Pets.BreedColour

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def breed_colour_fixture(attrs \\ %{}) do
      {:ok, breed_colour} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_breed_colour()

      breed_colour
    end

    test "list_breed_colours/0 returns all breed_colours" do
      breed_colour = breed_colour_fixture()
      assert Pets.list_breed_colours() == [breed_colour]
    end

    test "get_breed_colour!/1 returns the breed_colour with given id" do
      breed_colour = breed_colour_fixture()
      assert Pets.get_breed_colour!(breed_colour.id) == breed_colour
    end

    test "create_breed_colour/1 with valid data creates a breed_colour" do
      assert {:ok, %BreedColour{} = breed_colour} = Pets.create_breed_colour(@valid_attrs)
    end

    test "create_breed_colour/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_breed_colour(@invalid_attrs)
    end

    test "update_breed_colour/2 with valid data updates the breed_colour" do
      breed_colour = breed_colour_fixture()
      assert {:ok, %BreedColour{} = breed_colour} = Pets.update_breed_colour(breed_colour, @update_attrs)
    end

    test "update_breed_colour/2 with invalid data returns error changeset" do
      breed_colour = breed_colour_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_breed_colour(breed_colour, @invalid_attrs)
      assert breed_colour == Pets.get_breed_colour!(breed_colour.id)
    end

    test "delete_breed_colour/1 deletes the breed_colour" do
      breed_colour = breed_colour_fixture()
      assert {:ok, %BreedColour{}} = Pets.delete_breed_colour(breed_colour)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_breed_colour!(breed_colour.id) end
    end

    test "change_breed_colour/1 returns a breed_colour changeset" do
      breed_colour = breed_colour_fixture()
      assert %Ecto.Changeset{} = Pets.change_breed_colour(breed_colour)
    end
  end

  describe "pets" do
    alias Doubutsu.Pets.Pet

    @valid_attrs %{agility: 42, defense: 42, gender: 42, health: 42, hunger: 42, intellect: 42, level: 42, name: "some name", strength: 42}
    @update_attrs %{agility: 43, defense: 43, gender: 43, health: 43, hunger: 43, intellect: 43, level: 43, name: "some updated name", strength: 43}
    @invalid_attrs %{agility: nil, defense: nil, gender: nil, health: nil, hunger: nil, intellect: nil, level: nil, name: nil, strength: nil}

    def pet_fixture(attrs \\ %{}) do
      {:ok, pet} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_pet()

      pet
    end

    test "list_pets/0 returns all pets" do
      pet = pet_fixture()
      assert Pets.list_pets() == [pet]
    end

    test "get_pet!/1 returns the pet with given id" do
      pet = pet_fixture()
      assert Pets.get_pet!(pet.id) == pet
    end

    test "create_pet/1 with valid data creates a pet" do
      assert {:ok, %Pet{} = pet} = Pets.create_pet(@valid_attrs)
      assert pet.agility == 42
      assert pet.defense == 42
      assert pet.gender == 42
      assert pet.health == 42
      assert pet.hunger == 42
      assert pet.intellect == 42
      assert pet.level == 42
      assert pet.name == "some name"
      assert pet.strength == 42
    end

    test "create_pet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_pet(@invalid_attrs)
    end

    test "update_pet/2 with valid data updates the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{} = pet} = Pets.update_pet(pet, @update_attrs)
      assert pet.agility == 43
      assert pet.defense == 43
      assert pet.gender == 43
      assert pet.health == 43
      assert pet.hunger == 43
      assert pet.intellect == 43
      assert pet.level == 43
      assert pet.name == "some updated name"
      assert pet.strength == 43
    end

    test "update_pet/2 with invalid data returns error changeset" do
      pet = pet_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_pet(pet, @invalid_attrs)
      assert pet == Pets.get_pet!(pet.id)
    end

    test "delete_pet/1 deletes the pet" do
      pet = pet_fixture()
      assert {:ok, %Pet{}} = Pets.delete_pet(pet)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_pet!(pet.id) end
    end

    test "change_pet/1 returns a pet changeset" do
      pet = pet_fixture()
      assert %Ecto.Changeset{} = Pets.change_pet(pet)
    end
  end

  describe "owners" do
    alias Doubutsu.Pets.Owner

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def owner_fixture(attrs \\ %{}) do
      {:ok, owner} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Pets.create_owner()

      owner
    end

    test "list_owners/0 returns all owners" do
      owner = owner_fixture()
      assert Pets.list_owners() == [owner]
    end

    test "get_owner!/1 returns the owner with given id" do
      owner = owner_fixture()
      assert Pets.get_owner!(owner.id) == owner
    end

    test "create_owner/1 with valid data creates a owner" do
      assert {:ok, %Owner{} = owner} = Pets.create_owner(@valid_attrs)
    end

    test "create_owner/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pets.create_owner(@invalid_attrs)
    end

    test "update_owner/2 with valid data updates the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{} = owner} = Pets.update_owner(owner, @update_attrs)
    end

    test "update_owner/2 with invalid data returns error changeset" do
      owner = owner_fixture()
      assert {:error, %Ecto.Changeset{}} = Pets.update_owner(owner, @invalid_attrs)
      assert owner == Pets.get_owner!(owner.id)
    end

    test "delete_owner/1 deletes the owner" do
      owner = owner_fixture()
      assert {:ok, %Owner{}} = Pets.delete_owner(owner)
      assert_raise Ecto.NoResultsError, fn -> Pets.get_owner!(owner.id) end
    end

    test "change_owner/1 returns a owner changeset" do
      owner = owner_fixture()
      assert %Ecto.Changeset{} = Pets.change_owner(owner)
    end
  end
end
