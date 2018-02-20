require 'byebug'
require_relative 'piece.rb'
require_relative 'display.rb'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}
    # populate_board

  end

  def populate_board
    grid.each_index do |row|
      grid[row].each_index do |col|
        pos = [row, col]
        if [0, 1, 6, 7].include?(row)
          self[pos] = Piece.new#
        else
          self[pos] = NullPiece.new
        end
      end
    end
  end

  def move_piece(start_pos, end_pos) #[0,9]
    if self[start_pos].is_a? NullPiece
      raise "invalid start position"
    elsif start_pos.any? {|el| el < 0 || el > 7 }
      raise "Invalid start position"
    elsif end_pos.any?{|el| el < 0 || el > 7 }
      raise "Invalid end position"
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
    end
  end

<<<<<<< HEAD

=======
>>>>>>> 6f4d110356dde3dc83fe6297b31be36e6739128c
  # def display_render
  #   Display.render(self)
  # end

  def [](pos)
    row, col = pos
    grid[row][col]
  end
  #
  def []=(pos, value)
    row, col = pos

    grid[row][col] = value
  end

end
