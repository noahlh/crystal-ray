require "../support/**"

struct Vector
  include Tupleable
  include Spacial
  include Transformable

  getter x, y, z, w

  @w = 0.0

  def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
  end

  def self.new(input : Tuple)
    if input[3] == 0.0
      self.new(input[0], input[1], input[2])
    else
      raise Exception.new("w is !== 0, so this isn't a vector.")
    end
  end

  def +(other : Point)
    Point.new(self.to_tuple + other.to_tuple)
  end

  def dot(other : Vector)
    self.to_tuple.dot(other.to_tuple)
  end

  def magnitude
    Math.sqrt(@x**2 + @y**2 + @z**2 + @w**2)
  end

  def normalize
    Vector.new(@x / magnitude, @y / magnitude, @z / magnitude)
  end

  def cross(other : Vector)
    Vector.new(
      @y * other.z - @z * other.y,
      @z * other.x - @x * other.z,
      @x * other.y - @y * other.x
    )
  end

  def reflect(normal : Vector)
    self - normal * 2 * self.dot(normal)
  end
end
