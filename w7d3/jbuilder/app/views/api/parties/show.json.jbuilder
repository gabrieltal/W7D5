json.name @party.name
json.guests @party.guests do |guest|
  json.name guest.name
  json.gifts guest.gifts, :title
end


# json.extract! @party, :name, :location
#
# json.guests do
#   @party.guests.each_with_index do |guest, idx|
#     json.set! idx do
#       json.extract! guest, :name, :gifts
#     end
#   end
# end
# json.array! guest_array, :gifts
