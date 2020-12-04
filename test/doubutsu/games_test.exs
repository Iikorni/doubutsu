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

  describe "game_lock_types" do
    alias Doubutsu.Games.GameLockType

    @valid_attrs %{description: "some description", max_count: 42, name: "some name"}
    @update_attrs %{description: "some updated description", max_count: 43, name: "some updated name"}
    @invalid_attrs %{description: nil, max_count: nil, name: nil}

    def game_lock_type_fixture(attrs \\ %{}) do
      {:ok, game_lock_type} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game_lock_type()

      game_lock_type
    end

    test "list_game_lock_types/0 returns all game_lock_types" do
      game_lock_type = game_lock_type_fixture()
      assert Games.list_game_lock_types() == [game_lock_type]
    end

    test "get_game_lock_type!/1 returns the game_lock_type with given id" do
      game_lock_type = game_lock_type_fixture()
      assert Games.get_game_lock_type!(game_lock_type.id) == game_lock_type
    end

    test "create_game_lock_type/1 with valid data creates a game_lock_type" do
      assert {:ok, %GameLockType{} = game_lock_type} = Games.create_game_lock_type(@valid_attrs)
      assert game_lock_type.description == "some description"
      assert game_lock_type.max_count == 42
      assert game_lock_type.name == "some name"
    end

    test "create_game_lock_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game_lock_type(@invalid_attrs)
    end

    test "update_game_lock_type/2 with valid data updates the game_lock_type" do
      game_lock_type = game_lock_type_fixture()
      assert {:ok, %GameLockType{} = game_lock_type} = Games.update_game_lock_type(game_lock_type, @update_attrs)
      assert game_lock_type.description == "some updated description"
      assert game_lock_type.max_count == 43
      assert game_lock_type.name == "some updated name"
    end

    test "update_game_lock_type/2 with invalid data returns error changeset" do
      game_lock_type = game_lock_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game_lock_type(game_lock_type, @invalid_attrs)
      assert game_lock_type == Games.get_game_lock_type!(game_lock_type.id)
    end

    test "delete_game_lock_type/1 deletes the game_lock_type" do
      game_lock_type = game_lock_type_fixture()
      assert {:ok, %GameLockType{}} = Games.delete_game_lock_type(game_lock_type)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game_lock_type!(game_lock_type.id) end
    end

    test "change_game_lock_type/1 returns a game_lock_type changeset" do
      game_lock_type = game_lock_type_fixture()
      assert %Ecto.Changeset{} = Games.change_game_lock_type(game_lock_type)
    end
  end

  describe "game_lock" do
    alias Doubutsu.Games.GameLocks

    @valid_attrs %{count: 42}
    @update_attrs %{count: 43}
    @invalid_attrs %{count: nil}

    def game_lock_fixture(attrs \\ %{}) do
      {:ok, game_lock} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Games.create_game_lock()

      game_lock
    end

    test "list_game_locks/0 returns all game_locks" do
      game_lock = game_lock_fixture()
      assert Games.list_game_locks() == [game_lock]
    end

    test "get_game_lock!/1 returns the game_lock with given id" do
      game_lock = game_lock_fixture()
      assert Games.get_game_lock!(game_lock.id) == game_lock
    end

    test "create_game_lock/1 with valid data creates a game_lock" do
      assert {:ok, %GameLocks{} = game_lock} = Games.create_game_lock(@valid_attrs)
      assert game_lock.count == 42
    end

    test "create_game_lock/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_game_lock(@invalid_attrs)
    end

    test "update_game_lock/2 with valid data updates the game_lock" do
      game_lock = game_lock_fixture()
      assert {:ok, %GameLocks{} = game_lock} = Games.update_game_lock(game_lock, @update_attrs)
      assert game_lock.count == 43
    end

    test "update_game_lock/2 with invalid data returns error changeset" do
      game_lock = game_lock_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_game_lock(game_lock, @invalid_attrs)
      assert game_lock == Games.get_game_lock!(game_lock.id)
    end

    test "delete_game_lock/1 deletes the game_lock" do
      game_lock = game_lock_fixture()
      assert {:ok, %GameLocks{}} = Games.delete_game_lock(game_lock)
      assert_raise Ecto.NoResultsError, fn -> Games.get_game_lock!(game_lock.id) end
    end

    test "change_game_lock/1 returns a game_lock changeset" do
      game_lock = game_lock_fixture()
      assert %Ecto.Changeset{} = Games.change_game_lock(game_lock)
    end
  end
end
