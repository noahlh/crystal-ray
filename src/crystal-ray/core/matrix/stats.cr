module Matrix
  module Stats
    def size
      num_rows
    end

    def num_rows
      @data.size
    end

    def num_cols
      (first_row = @data.first?) ? first_row.size : 0
    end

    def invertible?
      determinant != 0
    end

    def square?
      num_rows == num_cols
    end
  end
end
