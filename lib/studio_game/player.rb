require_relative '../../lib/studio_game/treasure_hunt'
require_relative '../../lib/studio_game/playable'
module StudioGame
  class Player
    include Playable
    attr_reader :treasure_points
    attr_accessor :name  , :health
    def initialize(name,health = 100)
      @name = name.capitalize
      @health = health
      @treasure_points = Hash.new(0)
    end
    def score
      @health + points
    end
    def self.from_csv(line)
      name,rank = line.split(",")
      Player.new(name,((
      if rank == nil then
        0
      else
        Integer(rank)
      end)) )
    end
    def to_csv()
       "#{@name},#{points},#{health}"
    end

    def to_s
      "I'm #{@name} with a health of #{@health} and a score of #{score}"
    end
    def <=>(other_movie)
      other_movie.score <=> score
    end

    def add_points(treasure)
      @treasure_points[treasure.name] += treasure.points
      puts "#{@name} found #{treasure.name} with #{treasure.points} points"
    end

    def points()
      @treasure_points.values.reduce(0,:+)
    end

    def each_treasure
      @treasure_points.each do |name,points|
        yield Treasure.new(name,points)
      end
    end

  end
end