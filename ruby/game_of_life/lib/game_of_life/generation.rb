module GameOfLife
  class Generation < Array

    def evolve
      evolution = Evolution.new(self)
      evolution.evolutionary_process
      evolution.adjusting_new_generation
      evolution.next_generation
    end

  end
end
