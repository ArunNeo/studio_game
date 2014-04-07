module StudioGame
  Treasure = Struct.new(:name,:points)
  module TreasureHunt
    TREASTURES = [
       Treasure.new(:gem,1000),
       Treasure.new(:gold,900),
       Treasure.new(:silver,500),
       Treasure.new(:bronze,300)
    ]

    def self.random
      TREASTURES.sample
    end
  end
end