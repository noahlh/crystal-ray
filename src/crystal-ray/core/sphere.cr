struct Sphere
  getter origin, radius, material

  include Transformable

  def initialize(@origin : Point = Point.new(0, 0, 0), @radius : Float64 = 1.0, @material = Material.new)
  end

  def normal_at(p : Point)
    (p - origin).normalize
  end
end
