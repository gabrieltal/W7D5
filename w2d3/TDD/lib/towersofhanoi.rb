class TowersOfHanoi
  attr_accessor :tower

  def initialize(towers = nil)
    @tower = towers || [[3, 2, 1], [], []]
  end

  def won?
    @tower == [[], [3, 2, 1], []] || @tower == [[], [], [3, 2, 1]]
  end

  def move(start_tower, end_tower)
    raise "Start tower empty" if @tower[start_tower].empty?
    if @tower[end_tower].empty? || (@tower[end_tower].last > @tower[start_tower].last)
      @tower[end_tower] << @tower[start_tower].pop
    else
      raise "Invalid move"
    end
  end

  def display
    p @tower
  end

  def get_move
    # begin
      move = gets.chomp.split(",").map { |el| el.to_i}
      #valid_move?(move)
      move(move[0], move[1])
    # rescue
    #   puts "invalid move!"
    #   retry
    # end
  end

  def play
    until won?
      display
      get_move
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = TowersOfHanoi.new
  game.play
end
