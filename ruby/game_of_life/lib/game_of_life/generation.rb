module GameOfLife
  class Generation < Array

    def evolve
      evolution = Evolution.new(self)
      evolution.evolve
      evolution.next_generation
    end

  end
end
