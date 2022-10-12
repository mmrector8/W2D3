
require_relative "./board.rb"
require_relative "./human_player.rb"

class Game 
    attr_reader :player_1_mark, :player_2_mark

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new

    end 


    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
        else 
           @current_player = @player_1
        end
    end 

    def play
        #if there are still empty positions on the board

        while @board.empty_positions? 
            #print the board
            @board.print
            #get a position from current player
            player_pos = @current_player.get_position

             if @board.place_mark(player_pos, @current_player.mark) == false
                @board.place_mark(player_pos, @current_player.mark)
             else 
            #check if user won 
                if @board.win_row?(@current_player.mark) || @board.win_col?(@current_player.mark) || @board.win_diagonal?(@current_player.mark)
                #if they win, print victory message with name and end came
                    puts "#{@current_player.mark}, congratulations, you win!"
                    return
                else
                    self.switch_turn
                end
            end
        end

    end 



end 