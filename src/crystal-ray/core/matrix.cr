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

  def to_tuple
    @data.map { |el| el[0] }
  end

  def transpose
    Matrix.new(*cols)
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

  def *(b : Tuple)
    (self * Matrix.new(*b.map { |el| {el} })).to_tuple
  end

  def determinant
    (@data[0][0] * @data[1][1]) - (@data[1][0] * @data[0][1])
  end

  def submatrix(row_to_del, col_to_del)
    {% begin %}
      {% current_size = @type.type_vars.first.size %}
      rows_to_keep = (0..{{current_size - 1}}).reject { |i| i == row_to_del }
      cols_to_keep = (0..{{current_size - 1}}).reject { |i| i == col_to_del }
      Matrix.new(
        {% for r in (0...(current_size - 1)) %}
          {
            {% for c in (0...(current_size - 1)) %}
              @data[rows_to_keep[{{r}}]][cols_to_keep[{{c}}]],
            {% end %}
          },
        {% end %}
      )
    {% end %}
  end

  private def num_rows
    @data.size
  end

  private def num_cols
    @data[0].size
  end

  private def out_of_bounds?(x, y)
    raise Exception.new("Index out of bounds") if x > (num_rows) || y > (num_cols)
  end
end
