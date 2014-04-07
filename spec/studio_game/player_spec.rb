require_relative '../../lib/studio_game/player.rb'
require_relative '../../lib/studio_game/playable.rb'
module StudioGame
  include Playable
  describe Player do
    before do
      @initial_health = 150
      @player = Player.new("larry",@initial_health)
      $stdout = StringIO.new
    end

    it "has a capitalized name" do
      @player.name.should == "Larry"
    end

    it "has initial health" do
      @player.health.should == @initial_health
    end



    it "player has a score" do
      @player.score.should == @player.health + @player.points
    end

    it "increases health by 15 when w00ted" do
      @player.w00t
      @player.health.should == @initial_health + 15
    end

    it "decreases health by 10 when blammed" do
      @player.blam
      @player.health.should == @initial_health - 10
    end
    it "is a strong player" do
      @player.should be_strong
    end

    context "player with low health" do
      before do
        @initial_health = 80
        @player = Player.new("larry",@initial_health)
      end

      it "is a weak player" do
        @player.should_not be_strong
      end
    end
  end
end