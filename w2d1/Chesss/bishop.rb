require_relative 'slidingpiece.rb'
class Bishop < Piece
  include SlidingPiece
  def moves_dir
    [:diagonal]
  end
end
