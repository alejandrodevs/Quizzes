module GameOfLife
  class Evolution

    attr_accessor :generation, :next_generation

    def initialize generation
      @generation       = generation
      @next_generation  = Generation.new
    end

    def evolutionary_process
      generation.map(&:dup).each do |cell|
        cell.mitosis
        next_generation << cell
      end
    end

  end
end
