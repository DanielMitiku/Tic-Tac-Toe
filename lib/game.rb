class Game
    def initialize(game_board, game_player)
        @game_board = game_board
        @game_player = game_player
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

    def move(index, player)
        @game_board.board[index] = player
    end

    def valid_move?(index)
        if index.between?(0,8) && !@game_board.position_taken?(index)
           return true
        end
        return false
    end

    def full?
        @game_board.board.all? {|i| i == "X" || i == "O"}
    end

    def won?
        @WIN_COMBINATIONS.each do |win_combination|
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
          position_1 = @game_board.board[win_index_1] # value of game_board.board at win_index_1
          position_2 = @game_board.board[win_index_2] # value of game_board.board at win_index_2
          position_3 = @game_board.board[win_index_3] # value of game_board.board at win_index_3
          if (position_1 == position_2 && position_2 == position_3 && @game_board.position_taken?(win_index_1))
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
    
    def winner
        if won?
           return @winner
        end
    end


end