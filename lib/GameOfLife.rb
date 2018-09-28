require_relative './lib/interface'
class Game
  def game_on
    game = Interface.new
    game.start
  end
end

g = Game.new
g.game_on
