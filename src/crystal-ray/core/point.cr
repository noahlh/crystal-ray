require "../support/**"

struct Point
  include Tupleable
  include Spacial

  getter x, y, z, w

  @w = 1.0

  def initialize(@x : Float64 = 0.0, @y : Float64 = 0.0, @z : Float64 = 0.0)
  end
end
