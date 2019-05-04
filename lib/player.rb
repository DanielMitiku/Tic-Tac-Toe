class Player
    attr_accessor :current_player
    def initialize(current_player)
      @current_player = current_player if current_player == "X" || current_player == "O"
    end

    def player_change
        if @current_player == "X"
            @current_player = "O"
        elsif @current_player == "O"
            @current_player = "X"
        end
    end
    
end