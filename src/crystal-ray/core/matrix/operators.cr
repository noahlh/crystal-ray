module Matrix
  module Operators
    def *(b : Matrix::Base)
      Matrix.new(
        *self.rows.map do |a_row|
          b.cols.map do |b_col|
            a_row.dot(b_col)
          end
        end
      )
    end

    def *(b : Tuple)
      (self * Matrix.new(*b.map { |el| {el} })).to_tuple
    end

    def /(scalar)
      map { |el| el / scalar.to_f }
    end

    def -(scalar)
      map { |el| el - scalar }
    end

    def -(b : Matrix::Base)
      map_with_index { |el, el_idx, r_idx| el - b[r_idx, el_idx] }
    end

    def abs
      map { |el| el.abs }
    end
  end
end
