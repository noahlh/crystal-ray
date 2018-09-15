module Matrix
  module Modify
    # TODO:  This only works for 1x1 matrices -- make more generalized!
    def to_tuple
      @data.map { |el| el[0] }
    end

    def transpose
      Matrix.new(*cols)
    end

    def map
      Matrix.new(
        *rows.map do |r|
          r.map do |el|
            yield el
          end
        end
      )
    end

    def map_with_index
      Matrix.new(
        *rows.map_with_index do |r, r_idx|
          r.map_with_index do |el, el_idx|
            yield el, el_idx, r_idx
          end
        end
      )
    end

    def each
      rows.each do |r|
        r.each do |el|
          yield el
        end
      end
    end
  end
end
