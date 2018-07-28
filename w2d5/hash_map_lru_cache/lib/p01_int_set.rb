require 'byebug'

class MaxIntSet
  def initialize(max)
    @array = Array.new(max, false)
  end

  def insert(num)
    @array[num] = true if is_valid?(num)
    # debugger
  end

  def remove(num)
    @array[num] = false if is_valid?(num)
  end

  def include?(num)
    @array[num] == true if is_valid?(num)
  end

  private

  def is_valid?(num)
    raise 'Out of bounds' unless num.between?(0, @array.length-1)
    true
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store[num % num_buckets] << num
  end

  def remove(num)
    @store[num % num_buckets].delete(num)
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    #debugger
    resize! if count >= num_buckets
    unless include?(num)
      @store[num % num_buckets] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    not_a_store_array = Array.new(num_buckets * 2) { Array.new }
    @store.each do |arr|
      arr.each do |el|
        not_a_store_array[el % (num_buckets * 2)] << el
      end
    end
    @store = not_a_store_array
  end
end
