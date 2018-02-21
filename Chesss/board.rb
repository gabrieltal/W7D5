require 'byebug'
require_relative 'piece.rb'
require_relative 'display.rb'
require_relative 'rook.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'knight.rb'
require_relative 'king.rb'
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8){Array.new(8)}
    # populate_board

  end

  def populate_board
    grid.each_index do |row|
      grid[row].each_index do |col|
        pos = [row, col]
        if [1, 2, 3, 4, 5, 6].include?(row)
          self[pos] = NullPiece.instance
        else
          self[pos] = Piece.determine_piece(pos, self)
        end
      end
    end
  end

  def move_piece(start_pos, end_pos) #[0,9]
    if self[start_pos].is_a? NullPiece
      raise "invalid start position"
    elsif start_pos.any? {|el| el < 0 || el > 7 }
      raise "Invalid start position"
    elsif end_pos.any?{|el| el < 0 || el > 7 }
      raise "Invalid end position"
    else
      self[start_pos], self[end_pos] = self[end_pos], self[start_pos]
      self[end_pos].current_pos = end_pos
    end
  end

  # def display_render
  #   Display.render(self)
  # end
  def in_check?(check_team)
    king_pos = find_king_position(check_team)
    other_team = check_team == :black ? :white : :black
    op_pieces = team_pieces(other_team)
    checked_team = team_pieces(check_team)
    king_in_check(op_pieces, king_pos)
   # returns positions king can't move too
    # opponents_pieces.any? do |piece|
    #   piece.moves.include?(king_pos)
    # end
    checkmate?(other_team, king_pos)
  end

  def team_pieces(team)
    grid.flatten(1).select { |pos| pos.team == team }
  end

  def checkmate?(other_team, king_pos)
    op_team = team_pieces(other_team)
    checked_team = team_pieces()
    can_move = king_run(op_team, king_pos) #even add can_move to valid_moves?
    return false unless can_move.empty?
    assassins = possible_assassins(op_team, king_pos)
    return false if kill_assassin()
    #return "it can move"
  end

  def king_run(team_pieces, king_pos) #our team | assassin
    kings_moves = self[king_pos].moves
    can_move = []
    kings_moves.each do |move|
      can_move << move if team_pieces.none?{|piece| piece.moves.include?(move) }
    end
    can_move
  end

  def kill_assassin(team_pieces, assassin_pos)
    team_pieces.any? do |piece|
      piece.moves.include?(assassin_pos)
    end
  end

  # def block_assassin(team_pieces, assassin_pos)
  # def counter_moves(team_pieces, assassin_pos) #our team | assassin
  #   assassin_moves = self[assassin_pos].moves
  #    = []
  #   kings_moves.each do |move|
  #     can_move << move if team_pieces.none?{|piece| piece.moves.include?(move) }
  #   end
  #   can_move
  # end

  def king_in_check(team_pieces, king_pos)
    team_pieces.any? do |piece|
      piece.moves.include?(king_pos)
    end
  end

  def possible_assassins(team_pieces, king_pos)
    team_pieces.select do |piece|
      piece.moves.include?(king_pos)
    end
  end

  def find_king_position(check_team)
    found_king = grid.flatten(1).find do |pos|
      pos.team == check_team && pos.is_a?(King)
    end
    found_king.current_pos
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end
  #
  def []=(pos, value)
    row, col = pos

    grid[row][col] = value
  end

end
