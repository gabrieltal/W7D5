class Piece
  attr_reader :name
  def initialize(name = "|___|")#(position)

    @name = name







  end

  def to_s
    "#{name}"
  end

  def self.determine_piece(pos)
    #factory method
  end
end

class NullPiece < Piece
  def initialize
    super
  end
end
