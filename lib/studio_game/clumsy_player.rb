require_relative '../../lib/studio_game/player'
module StudioGame
  class ClumsyPlayer < Player

    def initialize (name,health,level)
      super(name,health)
      @level = level
    end

    def add_points(treasure)
      treasure.points = treasure.points/@level
      @treasure_points[treasure.name] += treasure.points
      puts "#{@name} found #{treasure.name} with #{treasure.points} points"
    end


  end
end