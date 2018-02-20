require 'colorize'
require_relative 'board'
require_relative 'cursor'
class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    board.grid.each do |row|
      p row
    end
  end
end
