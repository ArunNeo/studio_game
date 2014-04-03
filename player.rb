require_relative 'treasure_hunt'
class Player
	attr_reader :health,:treasure_points
	attr_accessor :name
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
    Player.new(name,Integer(rank))
  end
	def blam
		@health -= 10 
		puts "#{@name} got blammed!"
	end	
	def w00t
		@health += 15
		puts "#{@name} got Wooted!"
	end	
	def strong?
		health > 100
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