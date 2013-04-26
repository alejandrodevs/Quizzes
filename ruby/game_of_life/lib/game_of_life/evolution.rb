module GameOfLife
  class Evolution

    attr_accessor :generation, :next_generation

    def initialize generation
      @generation       = generation
      @next_generation  = generation.dup
    end

    def evolve
      # Evolutionary process here...
    end

  end
end
