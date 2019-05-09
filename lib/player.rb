class Player
    attr_reader :game_player
    def initialize(game_player, game_board)
      @game_player = game_player if game_player == "X" || game_player == "O"
      @game_board = game_board
    end

    def move(index)
        if valid_move?(index)
            @game_board.board[index] = @game_player
        end
    end
    
    private
    def valid_move?(index)
        if index.between?(0,8) && !@game_board.position_taken?(index)
           return true
        end
        return false
    end

end