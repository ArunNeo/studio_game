require_relative 'player.rb'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_hunt'
class Game 
	attr_reader :name 
	def initialize(name)
		@name = name
		@player_list = []
  end
  def load_players(filename)
    file.readline(filename).each do |line|
         add_player(Player.from_csv(line) )
    end
  end
	def add_player(player )
		@player_list << player
	end	
	def play(rounds)
		puts "There are #{@player_list.size} players in the game"
		puts @player_list.sort
		treasures = TreasureHunt::TREASTURES
		1.upto(rounds) do |n|
			puts "#{n} ." 
			@player_list.each do |player|
				GameTurn.take_turn(player)
				treasure = TreasureHunt.random
        player.add_points(treasure)
				puts player
			end	
    end
  def points_consumed
    @player_list.reduce(0) { |sum, player| sum += player.points }
  end
	def game_stats
    puts "#{@name} stats"

    puts "the totals treasure points found is #{points_consumed}"
    @player_list.each do |player|
      player.each_treasure  do |treasure|
        puts "#{treasure.points} total #{treasure.name} points"
      end
      puts "#{player.name.ljust(10,'.')}"
      puts "#{player.treasure_points}"
      puts "#{player.name} has a total points of #{player.points}"
    end
		strong , weak = @player_list.partition{|p| p.strong?}
		puts "Strong players "
		puts strong.sort
		puts "Weak players"
		puts weak.sort
	end	

	end	
end	