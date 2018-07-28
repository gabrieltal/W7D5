guest_ary = []
@guests.each do |guest|
  if (guest.age.between?(40, 50))
    guest_ary << guest
  end
end
json.array! guest_ary, :name, :age, :favorite_color
