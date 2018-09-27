require 'timers'
class GameOfLife 
    def initialize wid, hei 
            @wid = wid
            @hei = hei
            @current_move = Array.new(@hei){Array.new(@wid)}
            @next_move = Array.new(@hei){Array.new(@wid)}
            @grid = Array.new(@hei){Array.new(@wid)}
            @play = true
            @timers = Timers::Group.new
    end
    def run
        if @play
            @hei.times{|hei|
                @wid.times{|wid|
                    @next_move[hei][wid] = conditions_for_life(hei , wid)
                }
            }
            @hei.times{|hei|
                @wid.times{|wid|
                    @current_move[hei][wid] = @next_move[hei][wid]; 
                    if @current_move[hei][wid]
                        @grid[hei][wid] = "O"
                    else
                        @grid[hei][wid] = "." 
                    end
                }
            }
            @one_second_timer = @timers.after(1) {@grid.each{|grid| print "#{grid}\n"}}
            @timers.wait
        end
    end
    def conditions_for_life hei, wid
        neighbors = 0
        if wid > 0
            if @current_move[hei][wid-1]
                neighbors += 1
            end
            if hei > 0
                if @current_move[hei-1][wid-1]
                    neighbors += 1
                end
            end
            if hei < @hei - 1
                if @current_move[hei+1][wid-1]
                    neighbors += 1
                end
            end
        end
        if wid < @wid - 1
            if @current_move[hei][wid + 1]
                neighbors += 1
            end
            if hei > 0
                if @current_move[hei - 1][wid + 1]
                    neighbors += 1
                end
            end
            if hei < @hei - 1
                if @current_move[hei + 1][wid + 1]
                    neighbors += 1
                end
            end
        end
        if hei > 0
            if @current_move[hei - 1][wid]
                neighbors += 1
            end
        end
        if hei < @hei - 1
            if @current_move[hei + 1][wid]
               neighbors += 1
            end
        end
        if neighbors == 3
               return true
        elsif @current_move[hei][wid] && neighbors == 2
               return true
        else 
               return false
        end
    end
    def cell_status_change (x, y)
        if x.is_a?(Integer) && y.is_a?(Integer)
           @grid[x][y] = 
           @current_move[x][y] = true
        else
           return "Invalid command, you need to type Numbers"
        end
    end   
    def grid
        @hei.times{|hei| 
           @wid.times{|wid|
                if @current_move[hei][wid]
                     @grid[hei][wid] = "O"
                elsif !@current_move[hei][wid]
                     @grid[hei][wid] = "."
                else
                     return "There was a problem here"
                end
           }
        }
        @grid.each{|grid| print "#{grid}\n"}
    end
end

