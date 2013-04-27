module GameOfLife
  class Generation < Array

    def evolve
      evolution = Evolution.new(self)
      evolution.process
      evolution.adjusting_generation
      evolution.generation
    end

  end
end
