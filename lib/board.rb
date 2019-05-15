# frozen_string_literal: true

class Board
  attr_accessor :board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def position_taken?(index)
    if (@board[index] == 'X') || (@board[index] == 'O')
      true
    else
      false
    end
  end
end
