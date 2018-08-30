struct Color
  getter red, green, blue

  def initialize(@red : Float64, @green : Float64, @blue : Float64)
  end

  def initialize(*input : Tuple)
  end

  def to_tuple
    {@red, @green, @blue}
  end

  def +(other : Color)
    Color.new(self.to_tuple + other.to_tuple)
  end

  def -(other : Color)
  end

  def *(scalar : Float64)
  end
end
