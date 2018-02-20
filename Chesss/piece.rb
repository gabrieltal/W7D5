class Piece
<<<<<<< HEAD
  attr_reader :name
  def initialize(name = "|___|")#(position)

    @name = name
=======
  def initialize#(position)

>>>>>>> 6f4d110356dde3dc83fe6297b31be36e6739128c







<<<<<<< HEAD
  end

  def to_s
    "#{name}"
=======

>>>>>>> 6f4d110356dde3dc83fe6297b31be36e6739128c
  end

  def self.determine_piece(pos)
    #factory method
  end
<<<<<<< HEAD
end

class NullPiece < Piece
  def initialize
    super
=======
end 

class NullPiece < Piece
  def initialize

>>>>>>> 6f4d110356dde3dc83fe6297b31be36e6739128c
  end
end
