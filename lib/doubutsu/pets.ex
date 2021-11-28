defmodule Doubutsu.Pets do
  @moduledoc """
  The Pets context.
  """

  import Ecto.Query, warn: false
  alias Doubutsu.Repo

  alias Doubutsu.Pets.Breed

  @doc """
  Returns the list of breeds.

  ## Examples

      iex> list_breeds()
      [%Breed{}, ...]

  """
  def list_breeds do
    from(b in Breed,
      order_by: [asc: :id],
      preload: :display_colour)
    |> Repo.all()
  end

  @doc """
  Gets a single breed.

  Raises `Ecto.NoResultsError` if the Breed does not exist.

  ## Examples

      iex> get_breed!(123)
      %Breed{}

      iex> get_breed!(456)
      ** (Ecto.NoResultsError)

  """
  def get_breed!(id), do: Repo.get!(Breed, id)

  @doc """
  Creates a breed.

  ## Examples

      iex> create_breed(%{field: value})
      {:ok, %Breed{}}

      iex> create_breed(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_breed(attrs \\ %{}) do
    %Breed{}
    |> Breed.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a breed.

  ## Examples

      iex> update_breed(breed, %{field: new_value})
      {:ok, %Breed{}}

      iex> update_breed(breed, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_breed(%Breed{} = breed, attrs) do
    breed
    |> Breed.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a breed.

  ## Examples

      iex> delete_breed(breed)
      {:ok, %Breed{}}

      iex> delete_breed(breed)
      {:error, %Ecto.Changeset{}}

  """
  def delete_breed(%Breed{} = breed) do
    Repo.delete(breed)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking breed changes.

  ## Examples

      iex> change_breed(breed)
      %Ecto.Changeset{data: %Breed{}}

  """
  def change_breed(%Breed{} = breed, attrs \\ %{}) do
    Breed.changeset(breed, attrs)
  end

  alias Doubutsu.Pets.Colour

  @doc """
  Returns the list of colours.

  ## Examples

      iex> list_colours()
      [%Colour{}, ...]

  """
  def list_colours do
    Repo.all(Colour)
  end

  @doc """
  Gets a single colour.

  Raises `Ecto.NoResultsError` if the Colour does not exist.

  ## Examples

      iex> get_colour!(123)
      %Colour{}

      iex> get_colour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_colour!(id), do: Repo.get!(Colour, id)

  @doc """
  Creates a colour.

  ## Examples

      iex> create_colour(%{field: value})
      {:ok, %Colour{}}

      iex> create_colour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_colour(attrs \\ %{}) do
    %Colour{}
    |> Colour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a colour.

  ## Examples

      iex> update_colour(colour, %{field: new_value})
      {:ok, %Colour{}}

      iex> update_colour(colour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_colour(%Colour{} = colour, attrs) do
    colour
    |> Colour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a colour.

  ## Examples

      iex> delete_colour(colour)
      {:ok, %Colour{}}

      iex> delete_colour(colour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_colour(%Colour{} = colour) do
    Repo.delete(colour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking colour changes.

  ## Examples

      iex> change_colour(colour)
      %Ecto.Changeset{data: %Colour{}}

  """
  def change_colour(%Colour{} = colour, attrs \\ %{}) do
    Colour.changeset(colour, attrs)
  end

  alias Doubutsu.Pets.BreedColour

  @doc """
  Returns the list of breed_colours.

  ## Examples

      iex> list_breed_colours()
      [%BreedColour{}, ...]

  """
  def list_breed_colours do
    Repo.all(BreedColour)
  end

  @doc """
  Gets a single breed_colour.

  Raises `Ecto.NoResultsError` if the Breed colour does not exist.

  ## Examples

      iex> get_breed_colour!(123)
      %BreedColour{}

      iex> get_breed_colour!(456)
      ** (Ecto.NoResultsError)

  """
  def get_breed_colour!(id), do: Repo.get!(BreedColour, id)

  @doc """
  Creates a breed_colour.

  ## Examples

      iex> create_breed_colour(%{field: value})
      {:ok, %BreedColour{}}

      iex> create_breed_colour(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_breed_colour(attrs \\ %{}) do
    %BreedColour{}
    |> BreedColour.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a breed_colour.

  ## Examples

      iex> update_breed_colour(breed_colour, %{field: new_value})
      {:ok, %BreedColour{}}

      iex> update_breed_colour(breed_colour, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_breed_colour(%BreedColour{} = breed_colour, attrs) do
    breed_colour
    |> BreedColour.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a breed_colour.

  ## Examples

      iex> delete_breed_colour(breed_colour)
      {:ok, %BreedColour{}}

      iex> delete_breed_colour(breed_colour)
      {:error, %Ecto.Changeset{}}

  """
  def delete_breed_colour(%BreedColour{} = breed_colour) do
    Repo.delete(breed_colour)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking breed_colour changes.

  ## Examples

      iex> change_breed_colour(breed_colour)
      %Ecto.Changeset{data: %BreedColour{}}

  """
  def change_breed_colour(%BreedColour{} = breed_colour, attrs \\ %{}) do
    BreedColour.changeset(breed_colour, attrs)
  end

  alias Doubutsu.Pets.Pet

  @doc """
  Returns the list of pets.

  ## Examples

      iex> list_pets()
      [%Pet{}, ...]

  """
  def list_pets do
    Repo.all(Pet)
  end

  def list_all_pets_for_hunger do
    from(p in Pet,
      where: p.hunger != :dying)
    |> Repo.all()
  end

  @doc """
  Gets a single pet.

  Raises `Ecto.NoResultsError` if the Pet does not exist.

  ## Examples

      iex> get_pet!(123)
      %Pet{}

      iex> get_pet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pet!(id) do
    from(p in Pet,
      where: p.id == ^id,
      preload: [:breed, :colour])
    |> Repo.one!()
  end

  def get_pets_for_owner(owner) do
    from(pet in Pet,
          where: pet.owner_id == ^owner.id,
          preload: [:colour, :breed])
    |> Repo.all()
  end

  @doc """
  Creates a pet.

  ## Examples

      iex> create_pet(%{field: value})
      {:ok, %Pet{}}

      iex> create_pet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pet(attrs \\ %{}) do
    %Pet{}
    |> Pet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pet.

  ## Examples

      iex> update_pet(pet, %{field: new_value})
      {:ok, %Pet{}}

      iex> update_pet(pet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pet(%Pet{} = pet, attrs) do
    pet
    |> Pet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pet.

  ## Examples

      iex> delete_pet(pet)
      {:ok, %Pet{}}

      iex> delete_pet(pet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pet(%Pet{} = pet) do
    Repo.delete(pet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pet changes.

  ## Examples

      iex> change_pet(pet)
      %Ecto.Changeset{data: %Pet{}}

  """
  def change_pet(%Pet{} = pet, attrs \\ %{}) do
    Pet.changeset(pet, attrs)
  end

  alias Doubutsu.Pets.Owner

  @doc """
  Returns the list of owners.

  ## Examples

      iex> list_owners()
      [%Owner{}, ...]

  """
  def list_owners do
    Repo.all(Owner)
  end

  @doc """
  Gets a single owner.

  Raises `Ecto.NoResultsError` if the Owner does not exist.

  ## Examples

      iex> get_owner!(123)
      %Owner{}

      iex> get_owner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_owner!(id), do: Repo.get!(Owner, id)

  @doc """
  Creates a owner.

  ## Examples

      iex> create_owner(%{field: value})
      {:ok, %Owner{}}

      iex> create_owner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_owner(%Doubutsu.Accounts.User{} = user) do
    %Owner{user_id: user.id}
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.unique_constraint(:user_id)
    |> Repo.insert()
  end

  @doc """
  Updates a owner.

  ## Examples

      iex> update_owner(owner, %{field: new_value})
      {:ok, %Owner{}}

      iex> update_owner(owner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_owner(%Owner{} = owner, attrs) do
    owner
    |> Owner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a owner.

  ## Examples

      iex> delete_owner(owner)
      {:ok, %Owner{}}

      iex> delete_owner(owner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_owner(%Owner{} = owner) do
    Repo.delete(owner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking owner changes.

  ## Examples

      iex> change_owner(owner)
      %Ecto.Changeset{data: %Owner{}}

  """
  def change_owner(%Owner{} = owner, attrs \\ %{}) do
    Owner.changeset(owner, attrs)
  end
end
