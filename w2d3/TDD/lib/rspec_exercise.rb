class Array
  def my_uniq
    uniq = []
    self.each do |el|
      uniq << el unless uniq.include?(el)
    end
    uniq
  end

  def two_sum
    pairs = []
      self.each_index do |i|
        self.each_index do |k|
          if (self[i] + self[k] == 0) && i < k
            pairs << [i, k]
          end
        end
      end
    pairs
  end

  def my_transpose
    dimension = self.first.count
    cols = Array.new(dimension) { Array.new(dimension) }

    dimension.times do |i|
      dimension.times do |j|
        cols[j][i] = self[i][j]
      end
    end

    cols
  end

  def stockpicker
    best_pair = nil
    highest_value = 0

    self.each_index do |idx|
      self.each_index do |other|
        if (self[other] - self[idx] > highest_value) && other > idx
          highest_value = self[idx]
          best_pair = [idx, other]
        end
      end

    end

    best_pair
  end
end
