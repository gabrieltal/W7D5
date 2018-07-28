require_relative 'steppingpiece.rb'
class Knight < Piece
  include SteppingPiece

  def moves_dir
    [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
  end
end
