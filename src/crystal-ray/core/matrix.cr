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

  def size
    num_rows
  end

  def *(other : Matrix)
  end

  private def num_rows
    @data.size
  end

  private def num_columns
    @data[0].size
  end

  private def out_of_bounds?(x, y)
    raise Exception.new("Index out of bounds") if x > (num_rows) || y > (num_columns - 1)
  end
end
