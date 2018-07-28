require_relative 'board'
class Game

  def initialize
    @board = Board.new
  end

  def play_turn(pos)

  end


  def hit_bomb?(pos)
    return true if @board[pos] == :x
  end

  def play
    pos = @player.get_move
    until @board.won? || hit_bomb?
      @board.render
      pos = @player.get_move
      play_turn(pos)
    end
  end
end
