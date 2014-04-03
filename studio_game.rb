require_relative 'game.rb'



game1 = Game.new("KunckleHeads")

game1.load_players('players.csv')

loop do
  puts "how many rounds "
  answer = gets.chomp.downcase
  case  answer
    when /^\d+$/
      game1.play(Integer(answer))
    when 'quit','exit'
      game1.game_stats
      break
    else
      puts "enter number or quit"
  end

end



















