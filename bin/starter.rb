# frozen_string_literal: true

require '../lib/board.rb'
require '../lib/game.rb'
require '../lib/player.rb'

def choose_player
  user_input = gets.strip.upcase
  ask_time = 3
  while user_input != 'X' && user_input != 'O'
    puts 'Please enter X or O'
    user_input = gets.strip.upcase
    ask_time -= 1
    next unless ask_time < 1

    puts 'You have not chosen the correct input. Quiting....'
    exit
    return nil
  end
  user_input
end

puts 'Hello, This is TIC TAC TOE!'
puts 'What do you prefer, Player One? X or O'
player1 = choose_player
player2 = player1 == 'X' ? 'O' : 'X'
puts "Player one will be #{player1}, and Player two will be #{player2}. Player one will start"
