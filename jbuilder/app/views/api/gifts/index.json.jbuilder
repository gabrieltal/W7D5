gift_ary = []
@gifts.each do |gift|
  gift_ary << gift
end
json.array! gift_ary, :title, :description
