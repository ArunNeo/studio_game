require_relative '../../lib/studio_game/auditable.rb'
module StudioGame
  class Die
    include Auditable
    attr_reader :number

    def roll
      @number = rand(1..6)
      audit
      @number
    end
  end
end