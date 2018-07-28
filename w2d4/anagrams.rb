def first_anagram?(string1, string2) #O(n!)
  perms = string1.split("").permutation.to_a
  perms.map! { |arr| arr.join("") }
  perms.include?(string2)
end
# p first_anagram?("gizmo", "sally")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

def second_anagram?(string1, string2)  #O(n^2)
  return true if string1.empty?
  string2.length.times do |i|
    if string2[i] == string1[0]
      return second_anagram?(string1[1..-1], string2)
    end
  end
  false
end

 # p second_anagram?("gizmoeingeing", "sallygeingein")    #=> false
 # p second_anagram?("elviseingeing", "livesgeingein")    #=> true


def third_anagram?(string1, string2) #0(log n)
  string1.sort == string2.sort
end

# p third_anagram?("gizmoeingeing", "sallygeingein")    #=> false
# p third_anagram?("elviseingeing", "livesgeingein")    #=> true


def fourth_anagram?(string1, string2) #O(n) time, O(1) space
  string_hash = Hash.new(0)
  string1.chars.each do |ch|
    string_hash[ch] += 1
  end
  string2.chars.each do |ch|
    string_hash[ch] -= 1
  end
  string_hash.all? { |k, v| v == 0 }
end

p fourth_anagram?("gizmoeingeing", "sallygeingein")    #=> false
p fourth_anagram?("elviseingeing", "livesgeingein")    #=> true
