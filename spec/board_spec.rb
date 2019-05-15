# frozen_string_literal: true

require './lib/board.rb'

RSpec.describe Board do
  describe '#position_taken?' do
    it 'checks if the position is taken for a particular index' do
      board = Board.new
      board.board[0] = 'X'
      expect(board.position_taken?(0)).to eql(true)
    end
  end
end
