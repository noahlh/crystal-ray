struct Matrix(*T)
  @data : *T

  def initialize(*input : *T)
    @data = input
  end

  def [](x, y : Int32)
    unless out_of_bounds?(x, y)
      @data[x][y]
    end
  end

  def rows
    @data
  end

  def cols
    @data[0].map_with_index do |el, i|
      @data.map { |row| row[i] }
    end
  end

  def size
    num_rows
  end

  def *(b : Matrix)
    Matrix.new(
      *self.rows.map do |a_row|
        b.cols.map do |b_col|
          a_row.dot(b_col)
        end
      end
    )
  end

  private def num_rows
    @data.size
  end

  def num_cols
    @data[0].size
  end

  private def out_of_bounds?(x, y)
    raise Exception.new("Index out of bounds") if x > (num_rows) || y > (num_cols)
  end
end
