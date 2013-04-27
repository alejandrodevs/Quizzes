module GameOfLife
  class Evolution

    attr_accessor :generation, :next_generation

    def initialize generation
      @generation       = generation
      @next_generation  = Generation.new
    end

    def next_status
      @next_status ||= generation.map(&:dup).map{ |c| c.mitosis }
    end

    def evolutionary_process
      generation.each_with_index do |cell, x|
        cell.status = next_status[x]
        next_generation << cell
      end
    end

    def adjusting_new_generation
      next_generation.each do |cell|
        if cell.status == 0
          next_generation.delete(cell) if cell.neighbors_alive == 0
        else
          cell.neighbors_positions.each do |pos|
            if cell.send(pos).nil?
              new_cell = Cell.new
              cell.add_neighbor(new_cell, pos)
              new_cell.add_neighbor(cell, cell.inverse_position[pos])
              next_generation << new_cell
            end
          end
        end
      end
    end

  end
end
