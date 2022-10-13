
require_relative "./board.rb"
require_relative "./human_player.rb"

class Game 
    attr_reader :players, :current_player

    def initialize(n, *marks)
        @players =  marks.map do |mark|
            HumanPlayer.new(mark)
        end 
        @current_player = @players[0]
        @board = Board.new(n)

    end 

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
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