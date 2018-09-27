require_relative 'grid'
class Interface
       def start 
                helper = 0
                puts "Type in the size of the board"
                puts "Begin with the height"
                hei = gets.to_i
                puts "Now go for the width"
                wid = gets.to_i
                gol = GameOfLife.new(wid, hei)
                ready = false
                gol.grid
                while !ready
                        puts "Now enter the initial conditions of the game"
                        puts "Position in y"
                        x = gets.to_i
                        puts "Position in x"
                        y = gets.to_i
                        puts (gol.cell_status_change(x, y)).to_s
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
