require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def hash_index(key)
    key.hash % num_buckets
  end

  def include?(key)
    index = hash_index(key)
    @store[index].include?(key)
  end

  def set(key, val)
    resize! if @count >= num_buckets
    
    index = hash_index(key)
    if @store[index].include?(key)
      @store[index].update(key, val)
    else
      @store[index].append(key, val)
      @count += 1
    end
  end

  def get(key)
    index = hash_index(key)
    @store[index].get(key)
  end

  def delete(key)
    index = hash_index(key)
    if include?(key)
      @store[index].remove(key)
      @count -= 1
    end

  end

  def each
    @store.each do |list|
      list.each do |node|
        yield node.key, node.val
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    new_store = Array.new(2 * num_buckets) { LinkedList.new }
    each do |key, val|
      index = key.hash % (2 * num_buckets)
      new_store[index].append(key, val)
    end

    @store = new_store
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
