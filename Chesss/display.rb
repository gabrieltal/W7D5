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
    is_blk = false
    is_sel = cursor.selected
    p cursor.selected
    board.grid.each_index do |row|
      board.grid[row].each_index do |col|
        pos = [row, col]
        color = is_blk ? :black : :white
        o_color = is_blk ? :white : :black
        cursor_col = is_sel ? :blue : :yellow
        if pos == cursor.cursor_pos
          print "#{board[pos].to_s}".colorize(color: cursor_col, background: color)
        else
          print "#{board[pos].to_s}".colorize(color: o_color, background: color)
        end
        is_blk = !is_blk

      end
      is_blk = !is_blk
      print "\n"

    end
    # board.grid.each do |row|
    #   p row
    # board[cursor.cursor_pos].colorize(:blue)
    # end
  end

  def loopin
    # loop do
    loop do
    render
    input = cursor.get_input
    break if input != nil
    end
  end
end
