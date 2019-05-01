class Tic_tac_toe
   def initialize
    @board = [1,2,3,4,5,6,7,8,9]
    @winner = nil
    @WIN_COMBINATIONS = [ 
        [0,1,2], # top_row 
        [3,4,5], # middle_row 
        [6,7,8], # bottom_row 
        [0,3,6], # left_column 
        [1,4,7], # center_column 
        [2,5,8], # right_column 
        [0,4,8], # left_diagonal 
        [6,4,2] # right_diagonal 
        ]
   end

   def display_board
    puts
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "-----------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "-----------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
   end

   def move(index, player)
    @board[index] = player
   end

   def position_taken?(index)
    if (@board[index] == "X") || (@board[index] == "O") 
       return true
    else
       return false
    end
   end

   def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
       return true
    end
   end

   def turn_count
    counter = 0
    @board.each do |spaces|
       if spaces == "X" || spaces == "O"
          counter += 1
       end
    end
    counter
   end

   def current_player
    turn_count % 2 == 0 ? "X" : "O"
   end

   def play
    until over? 
       turn
    end 
    if won?
       display_board
       winner == "X" || winner == "O" 
       puts "Congratulations #{winner}!" 
    elsif draw?
       display_board
       puts "Game Draw, Please Play Again!" 
    end 
   end

   def turn
    display_board
    puts "Now it is #{current_player}'s turn"
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
       move(index, current_player)
    else
        puts "Please enter a valid move"
    end
    
   end

   def full?
    @board.all? {|i| i == "X" || i == "O"}
   end

   def won?
    @WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1] # value of board at win_index_1
      position_2 = @board[win_index_2] # value of board at win_index_2
      position_3 = @board[win_index_3] # value of board at win_index_3
      if (position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1))
        @winner = position_1
        return true 
      end
    end
    return false
   end

   def draw?
    if !won? && full?
      return true
    elsif !won? && !full?
      return false
    else
      return false
    end
   end

   def over?
    if draw? || won? || full?
      return true
    end
    false
   end

   def input_to_index(user_input)
    user_input.to_i - 1
   end

   def winner
    if won?
       return @winner
    end
 end

end

tic_tac_toe = Tic_tac_toe.new
tic_tac_toe.play
