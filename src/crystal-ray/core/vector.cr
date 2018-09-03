require "../support/**"

struct Vector
  include Tupleable
  include Spacial

  getter x, y, z, w

  @w = 0.0

  def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
  end

  def magnitude
    Math.sqrt(@x**2 + @y**2 + @z**2 + @w**2)
  end

  def normalize
    Vector.new(@x / magnitude, @y / magnitude, @z / magnitude)
  end

  def dot(other : Vector)
    (@x * other.x) + (@y * other.y) + (@z * other.z)
  end

  def cross(other : Vector)
    Vector.new(
      @y * other.z - @z * other.y,
      @z * other.x - @x * other.z,
      @x * other.y - @y * other.x
    )
  end
end
