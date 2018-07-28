require_relative 'steppingpiece.rb'
class King < Piece
  include SteppingPiece
  def moves_dir
    [[1, 0], [-1, 0], [0, 1], [0, -1], [1, 1], [-1, 1], [1, -1], [-1, -1]]
  end
end
