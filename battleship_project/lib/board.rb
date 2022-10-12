class Board
    attr_reader :size
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

end
