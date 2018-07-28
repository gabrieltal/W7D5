require 'byebug'
module SteppingPiece

  def moves
    moves = []

    moves += generate_steps(moves_dir)
    #get the moves and filter them
    moves.sort.uniq
  end

  def generate_steps(moves_dir) # is array
    moves = []
      moves_dir.each do |pos|
      #  debugger
        row, col = pos
        n_row = current_pos.first + row
        n_col = current_pos.last + col
        pos = [n_row, n_col]
        next if !n_row.between?(0, 7) || !n_col.between?(0, 7)
        next if board[pos].team == board[current_pos].team

        # break if board[pos].name != " ---- " && pos != current_pos
        moves << pos
      end
    moves
  end
end
