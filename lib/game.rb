# frozen_string_literal: true

require 'display.rb'

class Game
  include Display
  attr_accessor :winner
  def initialize(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two
    @winner = nil
    @current_player = player_one
    @WIN_COMBINATIONS = [
      [0, 1, 2], # top_row
      [3, 4, 5], # middle_row
      [6, 7, 8], # bottom_row
      [0, 3, 6], # left_column
      [1, 4, 7], # center_column
      [2, 5, 8], # right_column
      [0, 4, 8], # left_diagonal
      [6, 4, 2] # right_diagonal
    ]
  end

  def start_game
    display_board(@board)
    until over?
      if @current_player.move(input_to_index)
        display_board(@board)
        change_player
        display_current(@current_player == @player_one ? 'Player One' : 'Player Two')
      else
        again(@board)
      end
    end

    if won?
      display_board(@board)
      display_winner(@winner)
    elsif draw?
      display_draw
    end
  end

  def change_player
    @current_player == @player_one ? @current_player = @player_two : @current_player = @player_one
  end

  def full?
    @board.board.all? { |i| i == 'X' || i == 'O' }
  end

  def won?
    @WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board.board[win_index_1] # value of board.board at win_index_1
      position_2 = @board.board[win_index_2] # value of board.board at win_index_2
      position_3 = @board.board[win_index_3] # value of board.board at win_index_3
      if position_1 == position_2 && position_2 == position_3 && @board.position_taken?(win_index_1)
        @winner = position_1
        return true
      end
    end
    false
  end

  def draw?
    if !won? && full?
      true
    elsif !won? && !full?
      false
    else
      false
    end
  end

  def over?
    return true if draw? || won? || full?

    false
  end
end
