struct Tuple
  def +(other : Tuple)
    self.map_with_index { |el, idx| el + other[idx] }
  end

  def -(other : (Tuple | Point | Vector))
    self.map_with_index { |el, idx| el - other[idx] }
  end

  def *(scalar : Float64)
    self.map { |el| el * scalar }
  end

  def *(other : Tuple)
    self.map_with_index { |el, idx| el * other[idx] }
  end

  def /(scalar : Float64)
    self.map { |el| el / scalar }
  end

  def -
    self.map { |el| -el }
  end

  def dot(other : Tuple)
    (self * other).sum
  end

  def sum
    self.reduce { |acc, i| acc + i }
  end

  def abs
    self.map { |el| el.abs }
  end

  def <=(scalar)
    all? { |el| el <= scalar }
  end
end
