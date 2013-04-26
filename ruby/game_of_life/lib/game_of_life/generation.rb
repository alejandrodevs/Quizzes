module GameOfLife
  class Generation < Array

    def evolve
      evolution = Evolution.new(self)
      evolution.evolutionary_process
      evolution.next_generation
    end

    def adjusting

    end

  end
end
