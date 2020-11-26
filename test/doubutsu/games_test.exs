defmodule Doubutsu.GamesTest do
  use Doubutsu.DataCase

  alias Doubutsu.Games

  describe "scratch_types" do
    alias Doubutsu.Games.ScratchType

    @valid_attrs %{name: "some name", slug: "some slug"}
    @update_attrs %{name: "some updated name", slug: "some updated slug"}
    @invalid_attrs %{name: nil, slug: nil}

    def scratch_type_fixture(attrs \\ %{}) do
      {:ok, scratch_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_scratch_type()

      scratch_type
    end

    test "list_scratch_types/0 returns all scratch_types" do
      scratch_type = scratch_type_fixture()
      assert Games.list_scratch_types() == [scratch_type]
    end

    test "get_scratch_type!/1 returns the scratch_type with given id" do
      scratch_type = scratch_type_fixture()
      assert Games.get_scratch_type!(scratch_type.id) == scratch_type
    end

    test "create_scratch_type/1 with valid data creates a scratch_type" do
      assert {:ok, %ScratchType{} = scratch_type} = Games.create_scratch_type(@valid_attrs)
      assert scratch_type.name == "some name"
      assert scratch_type.slug == "some slug"
    end

    test "create_scratch_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_scratch_type(@invalid_attrs)
    end

    test "update_scratch_type/2 with valid data updates the scratch_type" do
      scratch_type = scratch_type_fixture()
      assert {:ok, %ScratchType{} = scratch_type} = Games.update_scratch_type(scratch_type, @update_attrs)
      assert scratch_type.name == "some updated name"
      assert scratch_type.slug == "some updated slug"
    end

    test "update_scratch_type/2 with invalid data returns error changeset" do
      scratch_type = scratch_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_scratch_type(scratch_type, @invalid_attrs)
      assert scratch_type == Games.get_scratch_type!(scratch_type.id)
    end

    test "delete_scratch_type/1 deletes the scratch_type" do
      scratch_type = scratch_type_fixture()
      assert {:ok, %ScratchType{}} = Games.delete_scratch_type(scratch_type)
      assert_raise Ecto.NoResultsError, fn -> Games.get_scratch_type!(scratch_type.id) end
    end

    test "change_scratch_type/1 returns a scratch_type changeset" do
      scratch_type = scratch_type_fixture()
      assert %Ecto.Changeset{} = Games.change_scratch_type(scratch_type)
    end
  end

  describe "scratch_prizes" do
    alias Doubutsu.Games.ScratchPrize

    @valid_attrs %{data: "some data", slug: "some slug", type: "some type"}
    @update_attrs %{data: "some updated data", slug: "some updated slug", type: "some updated type"}
    @invalid_attrs %{data: nil, slug: nil, type: nil}

    def scratch_prize_fixture(attrs \\ %{}) do
      {:ok, scratch_prize} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_scratch_prize()

      scratch_prize
    end

    test "list_scratch_prizes/0 returns all scratch_prizes" do
      scratch_prize = scratch_prize_fixture()
      assert Games.list_scratch_prizes() == [scratch_prize]
    end

    test "get_scratch_prize!/1 returns the scratch_prize with given id" do
      scratch_prize = scratch_prize_fixture()
      assert Games.get_scratch_prize!(scratch_prize.id) == scratch_prize
    end

    test "create_scratch_prize/1 with valid data creates a scratch_prize" do
      assert {:ok, %ScratchPrize{} = scratch_prize} = Games.create_scratch_prize(@valid_attrs)
      assert scratch_prize.data == "some data"
      assert scratch_prize.slug == "some slug"
      assert scratch_prize.type == "some type"
    end

    test "create_scratch_prize/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_scratch_prize(@invalid_attrs)
    end

    test "update_scratch_prize/2 with valid data updates the scratch_prize" do
      scratch_prize = scratch_prize_fixture()
      assert {:ok, %ScratchPrize{} = scratch_prize} = Games.update_scratch_prize(scratch_prize, @update_attrs)
      assert scratch_prize.data == "some updated data"
      assert scratch_prize.slug == "some updated slug"
      assert scratch_prize.type == "some updated type"
    end

    test "update_scratch_prize/2 with invalid data returns error changeset" do
      scratch_prize = scratch_prize_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_scratch_prize(scratch_prize, @invalid_attrs)
      assert scratch_prize == Games.get_scratch_prize!(scratch_prize.id)
    end

    test "delete_scratch_prize/1 deletes the scratch_prize" do
      scratch_prize = scratch_prize_fixture()
      assert {:ok, %ScratchPrize{}} = Games.delete_scratch_prize(scratch_prize)
      assert_raise Ecto.NoResultsError, fn -> Games.get_scratch_prize!(scratch_prize.id) end
    end

    test "change_scratch_prize/1 returns a scratch_prize changeset" do
      scratch_prize = scratch_prize_fixture()
      assert %Ecto.Changeset{} = Games.change_scratch_prize(scratch_prize)
    end
  end
end
