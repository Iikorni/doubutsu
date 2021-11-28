defmodule Doubutsu.Things do
  @moduledoc """
  The Things context.
  """

  import Ecto.Query, warn: false
  alias Doubutsu.Repo

  alias Doubutsu.Things.Item

  @doc """
  Returns the list of items.

  ## Examples

      iex> list_items()
      [%Item{}, ...]

  """
  def list_items do
    from(Item,
      order_by: [asc: :id],
      preload: :type)
    |> Repo.all
  end

  @doc """
  Gets a single item.

  Raises `Ecto.NoResultsError` if the Item does not exist.

  ## Examples

      iex> get_item!(123)
      %Item{}

      iex> get_item!(456)
      ** (Ecto.NoResultsError)

  """
  def get_item!(id) do
    from(i in Item,
      where: i.id == ^id,
      preload: :type)
    |> Repo.one!()
  end

  @doc """
  Creates a item.

  ## Examples

      iex> create_item(%{field: value})
      {:ok, %Item{}}

      iex> create_item(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a item.

  ## Examples

      iex> update_item(item, %{field: new_value})
      {:ok, %Item{}}

      iex> update_item(item, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_item(%Item{} = item, attrs) do
    item
    |> Item.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a item.

  ## Examples

      iex> delete_item(item)
      {:ok, %Item{}}

      iex> delete_item(item)
      {:error, %Ecto.Changeset{}}

  """
  def delete_item(%Item{} = item) do
    Repo.delete(item)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

      iex> change_item(item)
      %Ecto.Changeset{data: %Item{}}

  """
  def change_item(%Item{} = item, attrs \\ %{}) do
    Item.changeset(item, attrs)
  end

  alias Doubutsu.Things.Type

  @doc """
  Returns the list of types.

  ## Examples

      iex> list_types()
      [%Type{}, ...]

  """
  def list_types do
    Repo.all(Type)
  end

  @doc """
  Gets a single type.

  Raises `Ecto.NoResultsError` if the Type does not exist.

  ## Examples

      iex> get_type!(123)
      %Type{}

      iex> get_type!(456)
      ** (Ecto.NoResultsError)

  """
  def get_type!(id), do: Repo.get!(Type, id)

  alias Doubutsu.Things.{Inventory, Instance}

  @doc """
  Gets a single inventory.

  Raises `Ecto.NoResultsError` if the Inventory does not exist.

  ## Examples

      iex> get_inventory!(123)
      %Inventory{}

      iex> get_inventory!(456)
      ** (Ecto.NoResultsError)

  """
  def get_inventory!(id) do
    from(i in Inventory,
      where: i.id == ^id,
      preload: [user: :credential])
    |> Repo.one!()
  end

  def get_full_inventory!(id) do
    from(i in Inventory,
      where: i.id == ^id,
      preload: [instances:
        ^from(ins in Instance,
          order_by: [desc: ins.id],
          preload: :item)])
    |> Repo.one!()
  end

  @doc """
  Creates a inventory.

  ## Examples

      iex> create_inventory(%{field: value})
      {:ok, %Inventory{}}

      iex> create_inventory(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_inventory(%Doubutsu.Accounts.User{} = user) do
    %Inventory{user_id: user.id}
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.unique_constraint(:user_id)
    |> Repo.insert()
  end

  @doc """
  Updates a inventory.

  ## Examples

      iex> update_inventory(inventory, %{field: new_value})
      {:ok, %Inventory{}}

      iex> update_inventory(inventory, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_inventory(%Inventory{} = inventory, attrs) do
    inventory
    |> Inventory.changeset(attrs)
    |> Repo.update()
  end

  def subtract_cost(%Inventory{} = inventory, cost) do
    {1, [%Inventory{money: money}]} =
      from(i in Inventory, where: i.id == ^inventory.id, select: [:money])
      |> Repo.update_all(inc: [money: -cost])

    put_in(inventory.money, money)
  end

  def has_the_cash(%Inventory{} = inventory, cash) do
    inventory.money >= cash
  end

  @doc """
  Deletes a inventory.

  ## Examples

      iex> delete_inventory(inventory)
      {:ok, %Inventory{}}

      iex> delete_inventory(inventory)
      {:error, %Ecto.Changeset{}}

  """
  def delete_inventory(%Inventory{} = inventory) do
    Repo.delete(inventory)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking inventory changes.

  ## Examples

      iex> change_inventory(inventory)
      %Ecto.Changeset{data: %Inventory{}}

  """
  def change_inventory(%Inventory{} = inventory, attrs \\ %{}) do
    Inventory.changeset(inventory, attrs)
  end

  @doc """
  Gets a single instance.

  Raises `Ecto.NoResultsError` if the Instance does not exist.

  ## Examples

      iex> get_instance!(123)
      %Instance{}

      iex> get_instance!(456)
      ** (Ecto.NoResultsError)

  """
  def get_instance!(id), do: Repo.get!(Instance, id)

  @doc """
  Creates a instance.

  ## Examples

      iex> create_instance(%{field: value})
      {:ok, %Instance{}}

      iex> create_instance(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_instance(attrs \\ %{}) do
    %Instance{}
    |> Instance.changeset(attrs)
    |> Repo.insert()
  end

  def create_instance_from_item_inventory(%Item{} = item, %Inventory{} = inventory) do
    %Instance{}
    |> Instance.invitem_changeset(item, inventory)
    |> Repo.insert()
  end

  @doc """
  Updates a instance.

  ## Examples

      iex> update_instance(instance, %{field: new_value})
      {:ok, %Instance{}}

      iex> update_instance(instance, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_instance(%Instance{} = instance, attrs) do
    instance
    |> Instance.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a instance.

  ## Examples

      iex> delete_instance(instance)
      {:ok, %Instance{}}

      iex> delete_instance(instance)
      {:error, %Ecto.Changeset{}}

  """
  def delete_instance(%Instance{} = instance) do
    Repo.delete(instance)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking instance changes.

  ## Examples

      iex> change_instance(instance)
      %Ecto.Changeset{data: %Instance{}}

  """
  def change_instance(%Instance{} = instance, attrs \\ %{}) do
    Instance.changeset(instance, attrs)
  end
end
