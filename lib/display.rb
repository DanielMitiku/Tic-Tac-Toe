# frozen_string_literal: true

module Display
  def display_board(board)
    puts 'Choose the number shown below to fill the board'
    puts
    puts "#{board.board[0]} | #{board.board[1]} | #{board.board[2]}"
    puts '-----------'
    puts "#{board.board[3]} | #{board.board[4]} | #{board.board[5]}"
    puts '-----------'
    puts "#{board.board[6]} | #{board.board[7]} | #{board.board[8]}"
    puts
  end

  def input_to_index
    user_input = gets.strip
    user_input.to_i - 1
  end

  def again(board)
    puts '**************Wrong Input*****************'
    puts 'Please enter the correct number'
    display_board(board)
  end

  def display_winner(winner)
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts "Congratulations! #{winner} has won"
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!'
  end

  def display_draw
    puts 'Game drawn. Please try again.'
  end

  def display_current(current)
    puts "#{current}'s turn"
  end
  end
