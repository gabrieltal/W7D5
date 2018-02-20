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
    system('clear')
    board.grid.each_index do |row|
      board.grid[row].each_index do |col|
        pos = [row, col]
        if pos == cursor.cursor_pos
          print "#{board[pos].to_s}\t".colorize(:blue)
        else
          print "#{board[pos].to_s}\t".colorize(:red)
        end

      end
      print "\n"
    end
    # board.grid.each do |row|
    #   p row
    # board[cursor.cursor_pos].colorize(:blue)
    # end
  end

  def loopin
    loop do
    render
    cursor.get_input
    end
  end
end
