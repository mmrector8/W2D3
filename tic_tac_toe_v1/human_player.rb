class HumanPlayer
    attr_reader :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "#{@mark}'s turn"
        puts "Please enter two numbers with a space in between them, such as `7 `8"
        puts "This will select your game move"
        input = gets.chomp.split(" ")
        input.map!{|val| val = val.to_i}
    end 
end 