defmodule DoubutsuWeb.PetView do
  use DoubutsuWeb, :view

  def gender_str(gender) do
    case gender do
      :male -> raw "<span style=\"color:blue;\">Male</span>"
      :female -> raw "<span style=\"color:pink;\">Female</span>"
      :non_binary -> raw "<span style=\"color:purple;\">Non-Binary</span>"
    end
  end

  def hunger_str(hunger) do
    case hunger do
      :dying -> "Dying"
      :starving -> "Starving"
      :famished -> "Famished"
      :very_hungry -> "Very Hungry"
      :hungry -> "Hungry"
      :not_hungry -> "Not Hungry"
      :fine -> "Fine"
      :satiated -> "Satiated"
      :full_up -> "Full Up"
      :very_full -> "Very Full"
      :bloated -> "Bloated"
      :very_bloated -> "Very Bloated"
    end
  end

  def age_str(birthdate) do
    diff = NaiveDateTime.diff(NaiveDateTime.utc_now(), birthdate)
    days = trunc(Float.floor(diff / (60*60*24)))
    "#{Integer.to_string(days)} days"
  end

  def pet_img(pet) do
    img_tag("/images/pets/#{pet.breed.slug}/#{pet.colour.slug}.png")
  end
end
