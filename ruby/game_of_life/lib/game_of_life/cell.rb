module GameOfLife
  class Cell

    RULES = [[0,0,0,1,0,0,0,0,0], [0,0,1,1,1,0,0,0,0]]

    attr_accessor :n, :s, :e, :w, :ne, :nw, :se, :sw, :status

    def initialize status = 0
      @status = status
    end

    def neighbors
      [n, s, e, w, ne, nw, se, sw]
    end

    def neighbors_alive
      neighbors.map{ |n| n.status.to_i }.reduce(&:+)
    end

    def neighbors_positions
      [:n, :s, :e, :w, :ne, :nw, :se, :sw]
    end

    def inverse_position
      {
        :n  => :s,
        :s  => :n,
        :e  => :w,
        :w  => :e,
        :ne => :sw,
        :nw => :se,
        :se => :nw,
        :sw => :ne
      }
    end

    def add_neighbor neighbor, position
      send(:"#{position.to_s}=", neighbor)
    end

    def mitosis
      @status = RULES[status][neighbors_alive]
    end

  end
end
