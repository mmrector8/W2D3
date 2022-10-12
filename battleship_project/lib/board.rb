class Board
    attr_reader :size

   def self.print_grid(grid)
    #loop through grid array
    grid.each do |subarr|
        puts subarr.join(" ") 
    end 
  end 

  def initialize(n)
    @grid = Array.new(n){Array.new(n){|ele| ele = :N}} 
    @size = n * n
  end 


  def [](arr)
    @grid[arr[0]][arr[1]]
  end

  def []=(position,value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    @grid.flatten.count(:S)
  end 

  def attack(position)
     if self[position] == :S
        self[position]= :H
        puts "you sunk my battleship!"
         return true
     else
         self[position] = :X
         false
     end
  end 

  def place_random_ships
    quarter_of_elements = @size/4
    # quarter times
    length = (Math.sqrt(@size)-1).to_i
    i = 0
    while i < quarter_of_elements
        #get two random numbers from 0 to n-1
        random_num_1 = rand(0..length)
        random_num_2 = rand(0..length)
    # use those for position arr
        position_arr = [random_num_1, random_num_2]
    # give position_arr to assignment operator
        if self[position_arr] != :S
        self.[]=(position_arr, :S)
        i+=1
        end
    end
  end 

  def hidden_ships_grid
    hidden = []
    #loop through first array
    @grid.each do |subarr|
        #map on each subarr, push the new subarr to hidden
        hidden << subarr.map do |ele|
            if ele == :S 
                ele = :N
            else
                ele = ele
            end
        end 
    end 
    hidden
  end 

    def cheat
        Board.print_grid(@grid)
    end 

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
