# frozen_string_literal: true

class Player
  attr_reader :game_player
  def initialize(game_player, game_board)
    @game_player = game_player if game_player == 'X' || game_player == 'O'
    @game_board = game_board
  end

  def move(index)
    @game_board.board[index] = @game_player if valid_move?(index)
  end

  private

  def valid_move?(index)
    return true if index.between?(0, 8) && !@game_board.position_taken?(index)

    false
  end
end
