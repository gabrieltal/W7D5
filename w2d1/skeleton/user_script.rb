require_relative 'super_useful'
#   begin
#   puts "'five' == #{convert_to_int('five')}"
# rescue InputError => e
#     puts "Error was: #{e.message}"
#   end

# feed_me_a_fruit
begin
  sam = BestFriend.new('Jessica', 5, 'Sewing')
rescue StandardError => e
  puts e.message
ensure
  sam.talk_about_friendship
  sam.do_friendstuff
  sam.give_friendship_bracelet
end
