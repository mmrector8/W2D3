class Board
    attr_reader :grid
    def initialize(n)
       @grid = Array.new(n){Array.new(n){|ele| ele = "_"}} 
    end

    def [](position)
        @grid[position[0]][position[1]]
    end 
    
    def []=(position,value)
        @grid[position[0]][position[1]] = value
    end 

    def valid?(position) #[2,3]
        (0...@grid.length).each do |row|
            (0...@grid.length).each do |column|
                if position == [row, column]
                    return true
                end 
            end 
        end 
        false
        puts "out of bounds"
    end 
    
    def empty?(position)
        #if input is valid and value at position is a "_", return true
        if self[position] == "_"
            return true
        else
            false
        end
    end 

    def place_mark(position, mark)
        if self.valid?(position) && self.empty?(position)
            self[position] = mark
        else 
            return false

        end 
    end 

    def print
        @grid.each do |row|
            puts row.join(" ")
        end 
    end

    def win_row?(mark)
        #loop through the board
        @grid.each do |row|
            if row.all?{|ele| ele == mark}
                return true
             end
        end 
        false
    end 

    def win_col?(mark)
        transposed = @grid.transpose
        transposed.each do |column|
            if column.all?{|ele| ele == mark}
                return true
             end
        end 
        false
    end 

    def up_down?(mark)
        count = 0
            # if [0][0], [1][1], and [2,2] are all the same, return true
            (0...@grid.length).each do |row|
                     if @grid[row][row] == mark 
                        count +=1
                     end
            end 
        return true if count==grid.length
         false
    end 


    def down_up?(mark)
        count = 0
        (0...@grid.length).each do |row| # 0
                if  @grid[row][grid.length-row-1] == mark
                    count +=1
                end 
        end
            return true if count == grid.length
            false
    end 

    def win_diagonal?(mark)
        if down_up?(mark) || up_down?(mark)
            return true
        end
        false
     end 

     def win?(mark)
        if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
            return true
        end 
        false
     end 

     def empty_positions?
        @grid.each do |row|
         return true if row.any?{|ele| ele = "_"}
            false
        end 
     end


end 