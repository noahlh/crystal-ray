require "./color"

class Canvas
  property width, height
  @data : Array(Array(Color))

  def initialize(@width = 0, @height = 0)
    @data = Array.new(@height) { Array(Color).new(@width, Color.new(0, 0, 0)) }
  end

  def [](x : Int32, y : Int32)
    unless out_of_bounds?(x, y)
      @data[y][x]
    end
  end

  def []=(x : Int32, y : Int32, value : Color)
    unless out_of_bounds?(x, y)
      @data[y][x] = value
    end
  end

  def each_row(&block)
    @data.each { |row| yield row }
  end

  def each_row_with_index
    @data.each_with_index { |row, i| yield row, i }
  end

  def each_row
    @data.each
  end

  private def out_of_bounds?(x, y)
    raise Exception.new("Index out of bounds") if x > (@width - 1) || y > (@height - 1)
  end
end
