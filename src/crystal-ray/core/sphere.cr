struct Sphere
  getter origin, radius

  def initialize(@origin : Point = Point.new(0, 0, 0), @radius : Float64 = 1.0)
  end
end
