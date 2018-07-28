require 'singleton'
class Piece
  #switch to reader
  attr_accessor :name, :current_pos, :board, :team

  def initialize(name = "|___|", current_pos, board)#(position)
    @name = name #Remove me later
    @current_pos = current_pos
    @board = board
    @team = [0,1].include?(current_pos.first) ? :black : :white
  end

  def moves
  end

  def to_s
    "#{name}"
  end

  def self.determine_piece(pos, board)
    case pos
    when [0, 1], [0, 6], [7, 1], [7, 6]
      Knight.new("Knight", pos, board)
    when [0, 2], [0, 5], [7, 2], [7, 5]
      Bishop.new("Bishop", pos, board)
    when [0, 4], [7, 4]
      King.new(" King ", pos, board)
    when [0, 3], [7, 3]
      Queen.new("Queen ", pos, board)
    when [0, 0], [0, 7], [7, 0], [7, 7]
      Rook.new(" Rook ", pos, board)
    end
  end

end

class NullPiece < Piece
  include Singleton
  def initialize
    @name = " Null "
    @team = :null
  end

end

# class Rook < Piece
#   #include SlidingPiece
#   # def initialize
#   #   super
#   # end
#   def moves
#
#   end
# end
