module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def new_generation
      evolve_generation
      adjusting_generation
      generation
    end

    def next_statuses
      @next_status ||= generation.map(&:dup).map{ |c| c.mitosis }
    end

    def evolve_generation
      generation.each_with_index do |cell, x|
        cell.status = next_statuses[x]
      end
    end

    def adjusting_generation
      generation.each do |cell|
        adjusting_neighbors(cell) if cell.status == 1
      end
    end

    def adjusting_neighbors cell
      cell.neighbors_positions.each do |pos|

      end
    end

  end
end
