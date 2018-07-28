require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    resize! if @count >= num_buckets
    unless include?(key)
      @store[hash_index(key)] << key
      @count += 1
    end
  end

  def include?(key)
    @store[hash_index(key)].include?(key)
  end

  def hash_index(key)
    key.hash % num_buckets
  end

  def remove(key)
    if include?(key)
      @store[hash_index(key)].delete(key)
      @count -= 1
    end
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
        not_a_store_array[el.hash % (num_buckets * 2)] << el
      end
    end
    @store = not_a_store_array
  end
end
