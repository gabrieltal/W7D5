party_ary = []
@parties.each do |party|
  party_ary << party
end
json.array! party_ary, :name, :location
