class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil, sentinel = false)
    @key = key
    @val = val
    @next = nil
    @prev = nil
    @sentinel = sentinel
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def is_sentinel?
    @sentinel
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
    self.prev.next = self.next
    self.next.prev = self.prev
  end
end

class LinkedList
  include Enumerable
  attr_reader :head, :tail
  def initialize
    @head = Node.new(nil, nil, true)
    @tail = Node.new(nil, nil, true)
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.is_sentinel?
  end

  def get(key)
    target = find(key)
    return target.val unless target.nil?
    nil
  end

  def include?(key)
    find(key) ? true : false
  end

  def append(key, val)
    node = Node.new(key, val)
    @tail.prev.next = node
    node.prev = @tail.prev
    node.next = @tail
    @tail.prev = node
  end

  def update(key, val)
    target = find(key)
    target.val = val unless target.nil?
    nil
  end

  def find(key)
    curr = first
    until curr.is_sentinel?
      return curr if curr.key == key
      curr = curr.next
    end
    nil
  end

  def remove(key)
    target = find(key)
    target.remove unless target.nil?
    nil
  end

  def each
    curr = first
    until curr.is_sentinel?
      yield curr
      curr = curr.next
    end
    nil
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
