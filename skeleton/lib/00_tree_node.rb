require "byebug"
require_relative "Our_Queue.rb"
module Searchable
  def bfs(target)
    return self if @value == target
    queue = Our_Queue.new

    queue.enqueue(self)

    until queue.size == 0
      current_node = queue.peek
      #debugger
      if current_node.value == target
        return current_node
      end
      current_node.children.each do |child|
        queue.enqueue(child)
      end
      queue.dequeue
    end
    nil
  end

  def dfs(target)
    #return self
  end
end

class PolyTreeNode
  include Searchable
  attr_reader :parent, :children, :value

  def initialize(value)
    #debugger
    @value = value
    @parent = nil
    @children = []
  end

  # def parent
  #   self.parent
  # end

  def parent=(node)

    if !node.nil?
      @parent.children.reject! { |child| child == self } unless parent.nil?
      @parent = node
      @parent.children << self unless @parent.children.include?(self)
    else
      @parent = nil
    end

  end

  def add_child(child)
    @children << child
    child.parent = self
  end

  def remove_child(child)
    raise "Not a child!" unless @children.include?(child)
    child.parent = nil

    @children.reject! { |our_child| child == our_child }
  end

end
