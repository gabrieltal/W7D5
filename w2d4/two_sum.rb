def bad_two_sum?(arr, target_sum) #O(n^2)
  arr.each_index do |i|
    arr.each_index do |j|
      next if i == j
      return true if arr[i] + arr[j] == target_sum
    end
  end
  false
end

def okay_two_sum?(arr, target_sum)
  arr.sort!

  left = 0
  right = arr.length - 1
  until left == right
    value = arr[left] + arr[right]
    if value < target_sum
      left += 1
    elsif value > target_sum
      right -= 1
    else
      return true
    end
  end
  false
end

# arr = [0, 1, 2, 3, 5, 7, 10, 20, 30]
# p okay_two_sum?(arr, 6) # => should be true
# p okay_two_sum?(arr, 9) # => should be false

def hash_two_sum?(arr, target_sum)
  two_sum_hash = Hash.new(false)
  arr.each do |el|
    return true unless two_sum_hash[target_sum - el] == false
    two_sum_hash[el] = true
  end
  false
end

# arr = [0, 1, 5, 7]
# p hash_two_sum?(arr, 6) # => should be true
# p hash_two_sum?(arr, 10) # => should be false
#
# def hash_four_sum?(arr, target_sum)
#   four_sum_hash = Hash.new(false)
#   arr.each do |el|
#     return true unless four_sum_hash[target_sum - el] == false
#     four_sum_hash[el] = true
#   end
#   false
# end
#
# arr = [0, 1, 5, 7]
# p hash_four_sum?(arr, 6) # => should be true
# p hash_four_sum?(arr, 10) # => should be false
