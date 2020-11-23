defmodule Doubutsu.ThingsTest do
  use Doubutsu.DataCase

  alias Doubutsu.Things

  describe "items" do
    alias Doubutsu.Things.Item

    @valid_attrs %{description: "some description", name: "some name", no_trade: true, picture: "some picture", price: 42, rarity: 42, type: 42, weight: 42}
    @update_attrs %{description: "some updated description", name: "some updated name", no_trade: false, picture: "some updated picture", price: 43, rarity: 43, type: 43, weight: 43}
    @invalid_attrs %{description: nil, name: nil, no_trade: nil, picture: nil, price: nil, rarity: nil, type: nil, weight: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Things.create_item()

      item
    end

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Things.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Things.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Things.create_item(@valid_attrs)
      assert item.description == "some description"
      assert item.name == "some name"
      assert item.no_trade == true
      assert item.picture == "some picture"
      assert item.price == 42
      assert item.rarity == 42
      assert item.type == 42
      assert item.weight == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, %Item{} = item} = Things.update_item(item, @update_attrs)
      assert item.description == "some updated description"
      assert item.name == "some updated name"
      assert item.no_trade == false
      assert item.picture == "some updated picture"
      assert item.price == 43
      assert item.rarity == 43
      assert item.type == 43
      assert item.weight == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_item(item, @invalid_attrs)
      assert item == Things.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Things.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Things.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Things.change_item(item)
    end
  end

  describe "item_types" do
    alias Doubutsu.Things.ItemType

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def item_type_fixture(attrs \\ %{}) do
      {:ok, item_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Things.create_item_type()

      item_type
    end

    test "list_item_types/0 returns all item_types" do
      item_type = item_type_fixture()
      assert Things.list_item_types() == [item_type]
    end

    test "get_item_type!/1 returns the item_type with given id" do
      item_type = item_type_fixture()
      assert Things.get_item_type!(item_type.id) == item_type
    end

    test "create_item_type/1 with valid data creates a item_type" do
      assert {:ok, %ItemType{} = item_type} = Things.create_item_type(@valid_attrs)
      assert item_type.name == "some name"
    end

    test "create_item_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_item_type(@invalid_attrs)
    end

    test "update_item_type/2 with valid data updates the item_type" do
      item_type = item_type_fixture()
      assert {:ok, %ItemType{} = item_type} = Things.update_item_type(item_type, @update_attrs)
      assert item_type.name == "some updated name"
    end

    test "update_item_type/2 with invalid data returns error changeset" do
      item_type = item_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_item_type(item_type, @invalid_attrs)
      assert item_type == Things.get_item_type!(item_type.id)
    end

    test "delete_item_type/1 deletes the item_type" do
      item_type = item_type_fixture()
      assert {:ok, %ItemType{}} = Things.delete_item_type(item_type)
      assert_raise Ecto.NoResultsError, fn -> Things.get_item_type!(item_type.id) end
    end

    test "change_item_type/1 returns a item_type changeset" do
      item_type = item_type_fixture()
      assert %Ecto.Changeset{} = Things.change_item_type(item_type)
    end
  end

  describe "item_classes" do
    alias Doubutsu.Things.ItemClasses

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def item_classes_fixture(attrs \\ %{}) do
      {:ok, item_classes} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Things.create_item_classes()

      item_classes
    end

    test "list_item_classes/0 returns all item_classes" do
      item_classes = item_classes_fixture()
      assert Things.list_item_classes() == [item_classes]
    end

    test "get_item_classes!/1 returns the item_classes with given id" do
      item_classes = item_classes_fixture()
      assert Things.get_item_classes!(item_classes.id) == item_classes
    end

    test "create_item_classes/1 with valid data creates a item_classes" do
      assert {:ok, %ItemClasses{} = item_classes} = Things.create_item_classes(@valid_attrs)
    end

    test "create_item_classes/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_item_classes(@invalid_attrs)
    end

    test "update_item_classes/2 with valid data updates the item_classes" do
      item_classes = item_classes_fixture()
      assert {:ok, %ItemClasses{} = item_classes} = Things.update_item_classes(item_classes, @update_attrs)
    end

    test "update_item_classes/2 with invalid data returns error changeset" do
      item_classes = item_classes_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_item_classes(item_classes, @invalid_attrs)
      assert item_classes == Things.get_item_classes!(item_classes.id)
    end

    test "delete_item_classes/1 deletes the item_classes" do
      item_classes = item_classes_fixture()
      assert {:ok, %ItemClasses{}} = Things.delete_item_classes(item_classes)
      assert_raise Ecto.NoResultsError, fn -> Things.get_item_classes!(item_classes.id) end
    end

    test "change_item_classes/1 returns a item_classes changeset" do
      item_classes = item_classes_fixture()
      assert %Ecto.Changeset{} = Things.change_item_classes(item_classes)
    end
  end

  describe "types" do
    alias Doubutsu.Things.Type

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def type_fixture(attrs \\ %{}) do
      {:ok, type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Things.create_type()

      type
    end

    test "list_types/0 returns all types" do
      type = type_fixture()
      assert Things.list_types() == [type]
    end

    test "get_type!/1 returns the type with given id" do
      type = type_fixture()
      assert Things.get_type!(type.id) == type
    end

    test "create_type/1 with valid data creates a type" do
      assert {:ok, %Type{} = type} = Things.create_type(@valid_attrs)
      assert type.name == "some name"
    end

    test "create_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_type(@invalid_attrs)
    end

    test "update_type/2 with valid data updates the type" do
      type = type_fixture()
      assert {:ok, %Type{} = type} = Things.update_type(type, @update_attrs)
      assert type.name == "some updated name"
    end

    test "update_type/2 with invalid data returns error changeset" do
      type = type_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_type(type, @invalid_attrs)
      assert type == Things.get_type!(type.id)
    end

    test "delete_type/1 deletes the type" do
      type = type_fixture()
      assert {:ok, %Type{}} = Things.delete_type(type)
      assert_raise Ecto.NoResultsError, fn -> Things.get_type!(type.id) end
    end

    test "change_type/1 returns a type changeset" do
      type = type_fixture()
      assert %Ecto.Changeset{} = Things.change_type(type)
    end
  end

  describe "inventories" do
    alias Doubutsu.Things.Inventory

    @valid_attrs %{money: 42}
    @update_attrs %{money: 43}
    @invalid_attrs %{money: nil}

    def inventory_fixture(attrs \\ %{}) do
      {:ok, inventory} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Things.create_inventory()

      inventory
    end

    test "list_inventories/0 returns all inventories" do
      inventory = inventory_fixture()
      assert Things.list_inventories() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert Things.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      assert {:ok, %Inventory{} = inventory} = Things.create_inventory(@valid_attrs)
      assert inventory.money == 42
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Things.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{} = inventory} = Things.update_inventory(inventory, @update_attrs)
      assert inventory.money == 43
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = Things.update_inventory(inventory, @invalid_attrs)
      assert inventory == Things.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{}} = Things.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> Things.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = Things.change_inventory(inventory)
    end
  end
end
