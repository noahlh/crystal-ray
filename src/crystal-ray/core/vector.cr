require "../support/**"

struct Vector
  include Tupleable
  include Spacial
  include Transformable

  getter x, y, z, w

  @w = 0.0

  def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
  end
end
