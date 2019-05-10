require 'starter.rb'

board = Board.new
player_one = Player.new(player1,board)
player_two = Player.new(player2,board)
game = Game.new(board,player_one,player_two)

game.start_game


