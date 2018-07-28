require 'byebug' # # PHASE 2
class InputError < TypeError
  # def message
  #   puts "not the right type"
  # end
end

def convert_to_int(str) #'5'
  numbers = %w(0 1 2 3 4 5 6 7 8 9)
  unless str.chars.all?{|el| numbers.include?(el)}
    raise InputError.new "Nil"
  end

  Integer(str)

end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"

    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue
    puts "Give me an actual fruit"
  retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    if yrs_known < 5
      raise StandardError.new("You don't know this person long enough")
    elsif name.length <= 0 || fav_pastime.length <= 0
      raise StandardError.new("You don't know their name or fav pastime!")
    else
      @name = name
      @yrs_known = yrs_known
      @fav_pastime = fav_pastime
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
