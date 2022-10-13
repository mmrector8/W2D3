class ComputerPlayer
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        length = legal_positions.length
        random_idx = rand(0...length)
        legal_positions[random_idx]
    end 

end