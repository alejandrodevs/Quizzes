module GameOfLife
  class Cell

    attr_accessor :n, :s, :e, :w, :ne, :nw, :se, :sw, :status

    def initialize status = 0
      @status = status
    end

  end
end
