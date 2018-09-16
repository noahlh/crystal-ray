struct Ray
  getter origin, direction

  def initialize(@origin : Point, @direction : Vector)
  end

  def position(t : Float64)
    @origin + (@direction * t)
  end

  def intersect(s : Sphere)
  end
end
