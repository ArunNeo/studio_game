require_relative 'game'

describe Game do

  before do
    @game = Game.new("Knuckleheads")

    @initial_health = 100
    @player = Player.new("moe", @initial_health)
    
    @game.add_player(@player)
  end
  it "wooted when die is high number" do 
  	Die.any_instance.stub(:roll).and_return(5)
  	@game.play(3)
  	@player.health.should == @initial_health + (15*3)
  end	

  it "skipped when die is a medium number" do
   	Die.any_instance.stub(:roll).and_return(3)
  	@game.play(1)
  	@player.health.should == @initial_health
  end	 
  it "skipped when die is a medium number" do
   	Die.any_instance.stub(:roll).and_return(1)
  	@game.play(4)
  	@player.health.should == @initial_health - (10*4)
  end	  	
end