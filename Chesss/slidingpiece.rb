require 'byebug'
module SlidingPiece
  HORIZONTAL_DIRS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, 1], [1, -1], [-1, -1]]

  def moves
    moves = []
    # moves += case moves_dir
    if moves_dir == [:horizontal]
      moves += hor_moves
    elsif moves_dir == [:diagonal]
      moves += diag_moves
    elsif moves_dir == [:both]
      moves += diag_moves
      moves += hor_moves
    end
    moves.sort.uniq
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def hor_moves #position
    moves = []

    horizontal_dirs.each do |pos|
      row, col = pos # [1, 0]
      enemy_found = false
      (0..7).each do |idx|  #2

        break if enemy_found
        enemy_found = false
        n_row = row * idx + current_pos.first
        n_col = col * idx + current_pos.last
        pos = [n_row, n_col]
        next if pos == current_pos
        next if !n_row.between?(0, 7) || !n_col.between?(0, 7)
        break if board[pos].team == board[current_pos].team
        enemy_found = true if board[pos].team != board[current_pos].team && board[pos].team != :null
          # break if board[pos].name != " ---- " && pos != current_pos
        #Change to break if part of our own team
        #Another break if after position if enemy piece is at position
        #Next break coniditional if it is an enemy piece
        moves << [n_row, current_pos.last] #[2,0]
        moves << [current_pos.first, n_col] #[0,0] #non,factor
      end
    end

    moves.sort.uniq.select{|el| el[0].between?(0,7) && el[1].between?(0,7)}
  end

  def diag_moves
    moves = []
    diagonal_dirs.each do |pos|
      row, col = pos
      enemy_found = false
      (0..7).each do |idx|
        break if enemy_found
        enemy_found = false
        n_row = row * idx + current_pos.first
        n_col = col * idx + current_pos.last
        pos = [n_row, n_col]
        next if pos == current_pos
        next if !n_row.between?(0, 7) || !n_col.between?(0, 7)
        break if board[pos].team == board[current_pos].team
        enemy_found = true if board[pos].team != board[current_pos].team && board[pos].team != :null
        # break if board[pos].name != " ---- " && pos != current_pos
        moves << pos
      end
    end
    moves.sort.uniq.select{|el| el[0].between?(0,7) && el[1].between?(0,7)}
  end
end
