require_relative "board"
require_relative "player"

class Battleship

    attr_reader :board, :player
    def initialize(n)
        @player = Player.new
        @board = Board.new(n)
        @remaining_misses = @board.size/2
    end 

    def start_game
        @board.place_random_ships
         p @board.size/4
         @board.print
        end 

        def lose?
            if @remaining_misses <=0 
                puts "you lose"
                return true
            else
                false
            end 
        end 

        def win?
            @board.num_ships

            if @board.num_ships == 0
                puts "you win"
                return true
            else
                false
            end 
        end 

        def game_over?
            if self.win? || self.lose?
                return true
            else
                false
            end 
        end 


        def turn
            move = @player.get_move
            #@board.attack(move)
            if @board.attack(move) == false
                @remaining_misses -= 1
            end 
            @board.print
            puts @remaining_misses
        end 


end
