require_relative 'slidingpiece.rb'
class Queen < Piece
  include SlidingPiece

  def moves_dir
    [:both]
  end
end
