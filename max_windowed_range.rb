require 'byebug'
def naive_windowed_max_range(array, window_size) #0(n)
  current_max_range = nil
  array.each_index do |i|
    next if i + window_size > array.length
    window = array[i...window_size + i]
    max, min = window.max, window.min
    range = max - min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end
  current_max_range
end

# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
# p naive_windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
# p naive_windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# ~~~~~

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MyStack

  attr_reader :max, :min
  def initialize
    @store = []
    @max = 0
    @min = 1000
  end

  def max
    # peek[:max]
    @max
  end

  def min
    # peek[:min]
    @min
  end

  def pop
    @store.pop
    @min = @store.empty? ? 1000 : @store.first[:min]
    @max = @store.empty? ? 0 : @store.first[:max]
  end

  def push(el)
    #debugger
    if el.is_a? Hash
      @max = el[:max] if el[:max] > @max
      @min = el[:min] if el[:min] < @min
      @store.push(el)
    else
      @max = el if el > @max
      @min = el if el < @min
      hash = { max: @max, min: @min, value: el }
      @store.push(hash)
    end

  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class MinMaxStackQueue

  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def max
    @stack2.empty? ? @stack1.max : @stack2.max
  end

  def min
    @stack2.empty? ? @stack1.min : @stack2.min
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    if @stack2.empty?
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

end

def optimized_window(array, window_size)
  minMax = MinMaxStackQueue.new
  current_max_range = 0
  window_size.times do
    minMax.enqueue(array.shift)
  end

  until minMax.size < window_size
    debugger
    p "max #{minMax.max} ::: min #{minMax.min}"
    range = minMax.max - minMax.min
    #p range
    current_max_range = range if range > current_max_range
    break if array.empty?

    tmp = minMax.dequeue
    #break if array.empty?
    minMax.enqueue(array.shift)
    debugger

  end
  p current_max_range
  current_max_range
end

p optimized_window([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p optimized_window([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p optimized_window([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p optimized_window([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8

# ~~~~~
