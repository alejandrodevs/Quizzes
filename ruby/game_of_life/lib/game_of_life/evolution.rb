module GameOfLife
  class Evolution

    attr_accessor :generation

    def initialize generation
      @generation = generation
    end

    def next_statuses
      @next_status ||= generation.map(&:dup).map{ |c| c.mitosis }
    end

    def process
      generation.each_with_index do |cell, x|
        cell.status = next_statuses[x]
      end
    end

    def adjusting_generation
      generation.each do |cell|
        if cell.status == 0
          generation.delete(cell) if cell.neighbors_alive == 0
        else
          cell.neighbors_positions.each do |pos|
            if cell.send(pos).nil?
              new_cell = Cell.new
              cell.add_neighbor(new_cell, pos)
              new_cell.add_neighbor(cell, cell.inverse_position[pos])
              generation << new_cell
            end
          end
        end
      end
    end

  end
end
