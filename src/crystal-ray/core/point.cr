require "../support/**"

struct Point
  include Tupleable
  include Spacial
  include Transformable

  getter x, y, z, w

  @w = 1.0

  def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
  end

  def self.new(input : Tuple)
    if input[3] == 1.0
      self.new(input[0], input[1], input[2])
    else
      raise Exception.new("w is !== 1, so this isn't a point.")
    end
  end

  def -(other : Point)
    Vector.new(self.to_tuple - other.to_tuple)
  end
end
