defmodule Doubutsu.Things.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :description, :string
    field :name, :string
    field :no_trade, :boolean, default: false
    field :picture, :string
    field :price, :integer
    field :rarity, :integer
    field :weight, :integer

    field :picture_file, :map, virtual: true

    belongs_to :type, Doubutsu.Things.Type

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:name, :description, :weight, :price, :rarity, :no_trade, :picture_file, :type_id])
    |> validate_required([:name, :description, :weight, :price, :rarity, :picture_file, :no_trade])
    |> cast_assoc(:type)
    |> handle_image(attrs)
  end

  def handle_image(item, _attrs) do
    if upload = get_change(item, :picture_file) do
      File.cp(upload.path, Path.expand("./uploads/items/#{upload.filename}"))
      put_change(item, :picture, upload.filename)
    else
      item
    end
  end
end
