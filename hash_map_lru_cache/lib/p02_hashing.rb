require 'byebug'
class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    current_hash = 0
    # self.map { |el| el.hash }.reduce { |l,r| l ^ r }
    self.each_with_index do |el, idx|
      current_hash = current_hash ^ el.hash << idx
    end
    current_hash
  end
end

class String
  def hash
    self.chars.map { |ch| ch.ord }.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash  
    val = self.to_a.map { |el| el.hash }.reduce(:+)
    val.nil? ? 0 : val
  end
end
