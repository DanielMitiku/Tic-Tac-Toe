require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Player do
    describe "#move" do
        it "checks if a player takes a move to the desired position" do
            board = Board.new
            player_one = Player.new("X",board)
            board.board[0] = "X"
            expect(player_one.move(1)).to eql(board.board[1])
        end
    end
end
