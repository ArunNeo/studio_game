require_relative '../../lib/studio_game/player'
require_relative '../../lib/studio_game/die'
require_relative '../../lib/studio_game/game_turn'
require_relative '../../lib/studio_game/treasure_hunt'
module  StudioGame
  class Game
    attr_reader :name
    def initialize(name)
      @name = name
      @player_list = []
    end
    def load_players(filename)
      File.readlines(filename).each { |line| add_player(Player.from_csv(line)) }
    end
    def save(to_file = "result.csv")
      File.open(to_file, "w") do |file|
        file.puts "#{@name} High Scores:"
        @player_list.sort.each { |player| file.puts player.to_csv() }
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
      save()
  end

  end
  end
end