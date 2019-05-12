require './lib/game.rb'
require './lib/board.rb'
require './lib/player.rb'

RSpec.describe Game do
    describe "#won?" do
        it "checks if a player won" do
            board = Board.new
            player_one = Player.new("X",board)
            player_two = Player.new("O",board)
            game = Game.new(board,player_one,player_two)

            board.board[0] = "X"
            board.board[1] = "X"
            board.board[2] = "X"
            expect(game.won?).to eql(true)
        end
    end

    describe "#full?" do
        it "checks if the board is full" do
            board = Board.new
            player_one = Player.new("X",board)
            player_two = Player.new("O",board)
            game = Game.new(board,player_one,player_two)

            board.board[0] = "X"
            board.board[1] = "O"
            board.board[2] = "X"
            board.board[3] = "O"
            board.board[4] = "X"
            board.board[5] = "O"
            board.board[6] = "X"
            board.board[7] = "O"
            board.board[8] = "X"
            expect(game.full?).to eql(true)
        end
    end

    describe "#draw?" do
        it "checks if the game ends without a winner" do
            board = Board.new
            player_one = Player.new("X",board)
            player_two = Player.new("O",board)
            game = Game.new(board,player_one,player_two)

            board.board[0] = "X"
            board.board[1] = "X"
            board.board[2] = "X"
            expect(game.draw?).to eql(false)
        end
    end
end
