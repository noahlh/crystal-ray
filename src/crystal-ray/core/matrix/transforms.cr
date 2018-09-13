module Matrix
  module Transforms
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
  end
end
