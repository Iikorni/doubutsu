defmodule Doubutsu.PrizesTest do
  use Doubutsu.DataCase

  alias Doubutsu.Prizes

  describe "prize_pools" do
    alias Doubutsu.Prizes.PrizePool

    @valid_attrs %{description: "some description", name: "some name"}
    @update_attrs %{description: "some updated description", name: "some updated name"}
    @invalid_attrs %{description: nil, name: nil}

    def prize_pool_fixture(attrs \\ %{}) do
      {:ok, prize_pool} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prizes.create_prize_pool()

      prize_pool
    end

    test "list_prize_pools/0 returns all prize_pools" do
      prize_pool = prize_pool_fixture()
      assert Prizes.list_prize_pools() == [prize_pool]
    end

    test "get_prize_pool!/1 returns the prize_pool with given id" do
      prize_pool = prize_pool_fixture()
      assert Prizes.get_prize_pool!(prize_pool.id) == prize_pool
    end

    test "create_prize_pool/1 with valid data creates a prize_pool" do
      assert {:ok, %PrizePool{} = prize_pool} = Prizes.create_prize_pool(@valid_attrs)
      assert prize_pool.description == "some description"
      assert prize_pool.name == "some name"
    end

    test "create_prize_pool/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prizes.create_prize_pool(@invalid_attrs)
    end

    test "update_prize_pool/2 with valid data updates the prize_pool" do
      prize_pool = prize_pool_fixture()
      assert {:ok, %PrizePool{} = prize_pool} = Prizes.update_prize_pool(prize_pool, @update_attrs)
      assert prize_pool.description == "some updated description"
      assert prize_pool.name == "some updated name"
    end

    test "update_prize_pool/2 with invalid data returns error changeset" do
      prize_pool = prize_pool_fixture()
      assert {:error, %Ecto.Changeset{}} = Prizes.update_prize_pool(prize_pool, @invalid_attrs)
      assert prize_pool == Prizes.get_prize_pool!(prize_pool.id)
    end

    test "delete_prize_pool/1 deletes the prize_pool" do
      prize_pool = prize_pool_fixture()
      assert {:ok, %PrizePool{}} = Prizes.delete_prize_pool(prize_pool)
      assert_raise Ecto.NoResultsError, fn -> Prizes.get_prize_pool!(prize_pool.id) end
    end

    test "change_prize_pool/1 returns a prize_pool changeset" do
      prize_pool = prize_pool_fixture()
      assert %Ecto.Changeset{} = Prizes.change_prize_pool(prize_pool)
    end
  end

  describe "prizes" do
    alias Doubutsu.Prizes.Prize

    @valid_attrs %{weight: 42}
    @update_attrs %{weight: 43}
    @invalid_attrs %{weight: nil}

    def prize_fixture(attrs \\ %{}) do
      {:ok, prize} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Prizes.create_prize()

      prize
    end

    test "list_prizes/0 returns all prizes" do
      prize = prize_fixture()
      assert Prizes.list_prizes() == [prize]
    end

    test "get_prize!/1 returns the prize with given id" do
      prize = prize_fixture()
      assert Prizes.get_prize!(prize.id) == prize
    end

    test "create_prize/1 with valid data creates a prize" do
      assert {:ok, %Prize{} = prize} = Prizes.create_prize(@valid_attrs)
      assert prize.weight == 42
    end

    test "create_prize/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Prizes.create_prize(@invalid_attrs)
    end

    test "update_prize/2 with valid data updates the prize" do
      prize = prize_fixture()
      assert {:ok, %Prize{} = prize} = Prizes.update_prize(prize, @update_attrs)
      assert prize.weight == 43
    end

    test "update_prize/2 with invalid data returns error changeset" do
      prize = prize_fixture()
      assert {:error, %Ecto.Changeset{}} = Prizes.update_prize(prize, @invalid_attrs)
      assert prize == Prizes.get_prize!(prize.id)
    end

    test "delete_prize/1 deletes the prize" do
      prize = prize_fixture()
      assert {:ok, %Prize{}} = Prizes.delete_prize(prize)
      assert_raise Ecto.NoResultsError, fn -> Prizes.get_prize!(prize.id) end
    end

    test "change_prize/1 returns a prize changeset" do
      prize = prize_fixture()
      assert %Ecto.Changeset{} = Prizes.change_prize(prize)
    end
  end
end
