require_relative 'slidingpiece.rb'
class Rook < Piece
  include SlidingPiece
  # def initialize
  #   super
  # end
  # def moves
  #
  # end

  def moves_dir
    [:horizontal]
  end
end
