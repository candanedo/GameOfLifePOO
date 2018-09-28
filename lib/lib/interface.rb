require_relative 'grid'
require_relative 'validations'
class Interface
  def initialize
    @validate = Validations.new
  end
  def start
    helper = 0
    puts "Type in the size of the board"
    hei = ""
    wid = ""
    while !@validate.validate_array_values(hei)
      puts "Begin with the height"
      hei = gets.to_i
    end 
    while !@validate.validate_array_values(wid)
      puts "Now go for the width"
      wid = gets.to_i
    end
    gol = GameOfLife.new(hei, wid)
    ready = false
    gol.grid
    while !ready
      x = ""
      y = ""
      puts "Now enter the initial conditions of the game" 
      while x.to_i == 0 || !@validate.validate_coordinates(x)
        puts "Position in rows"
        x = gets.to_i
      end
      while y.to_i == 0 || !@validate.validate_coordinates(y)
        puts "Position in columns"
        y = gets.to_i
      end
        gol.cell_status_change(x, y)
        puts "Wanna keep adding initial conditions"
        helper = gets.to_i
        gol.grid
        ready = helper==1 ? true : false
    end
    count = 0
    1000.times{
      count += 1
      puts count
      gol.run
    }
    gol.run
  end
end
