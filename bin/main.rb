require '../lib/board.rb'
require '../lib/game.rb'
require '../lib/player.rb'

class Main_class
    def display_board(board)
        puts
        puts "#{board.board[0]} | #{board.board[1]} | #{board.board[2]}"
        puts "-----------"
        puts "#{board.board[3]} | #{board.board[4]} | #{board.board[5]}"
        puts "-----------"
        puts "#{board.board[6]} | #{board.board[7]} | #{board.board[8]}"
        puts
    end

    def input_to_index(user_input)
        user_input.to_i - 1
    end

    def play(game,player,board)
        display_board(board)
        until game.over? 
            puts "Now it is #{player.current_player}'s turn"
            puts "Please enter 1-9:"
            user_input = gets.strip
            index = input_to_index(user_input)
            if game.valid_move?(index)
                game.move(index, player.current_player)
                player.player_change
                display_board(board)
            else
                puts "Please enter a valid move"
            end
        end 
        if game.won?
        display_board(board)
        game.winner == "X" || game.winner == "O" 
        puts "Congratulations #{game.winner}!" 
        elsif game.draw?
        display_board(board)
        puts "Game Draw, Please Play Again!" 
        end 
    end
end

board = Board.new
player = Player.new("X")
game = Game.new(board,player)

tic_tac_toe = Main_class.new
tic_tac_toe.play(game,player,board)

