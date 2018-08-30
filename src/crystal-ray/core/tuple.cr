struct Tuple
  def +(other : Tuple)
    self.map_with_index { |el, idx| el + other[idx] }
  end

  def -(other : Tuple)
    self.map_with_index { |el, idx| el - other[idx] }
  end

  def *(scalar : Float64)
    self.map { |el| el * scalar }
  end

  def /(scalar : Float64)
    self.map { |el| el / scalar }
  end

  def -
    self.map { |el| -el }
  end
end
