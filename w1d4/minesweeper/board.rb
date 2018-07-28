class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    @reveal = false
  end

  def populate
    arr = [:x, :o]
    @grid.each_with_index do |row, idx|
      row.each_index do |col|
        @grid[idx][col] = arr.sample
      end
    end
  end

  def reveal?
    @reveal
  end

  def flip
    @reveal = true
  end
end
