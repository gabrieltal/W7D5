list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

def my_min_1(list) # O(n^2)
  smallest = 1000000
  list.each_index do |i|
    (i...list.length).each do |j|
      smallest = list[i] if list[i] < list[j] && smallest > list[i]
    end
  end
  smallest
end


def my_min_2(list) #O(n)
  smallest = 1000000
  list.each do |el|
    if el < smallest
      smallest = el
    end
  end
  smallest
end

p my_min_1(list)
p my_min_2(list)

def largest_contiguous_subsum_1(list) #O(n^2) time, O(2^n) space
  subarr_list = []
  list.each_index do |i|
    (i...list.length).each do |j|
      next if list[i...j].empty?
      subarr_list << list[i..j]
    end
  end
  largest = 0
  subarr_list.each do |arr|
    curr_val = arr.reduce(:+)
    largest = curr_val if curr_val > largest
  end
  largest
end

def largest_contiguous_subsum_2(list) #O(n) time , O(1) memory
  max_until_now = 0
  max_end_here = 0
  list.each do |el|
    max_end_here += el
    max_until_now = max_end_here if max_end_here > max_until_now
    max_end_here = 0 if max_end_here < 0
  end
  max_until_now
end

p largest_contiguous_subsum_1(list)
p largest_contiguous_subsum_2(list)
