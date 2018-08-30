module RayTupleable
  getter x, y, z, w

  def initialize(@x : Float64, @y : Float64, @z : Float64, @w : Float64)
  end

  def to_tuple
    {@x, @y, @z, @w}
  end

  def +(other : RayTupleable)
    TupleFactory.create(self.to_tuple + other.to_tuple)
  end

  def -(other : RayTupleable)
    TupleFactory.create(self.to_tuple - other.to_tuple)
  end
end

class TupleFactory
  def self.create(x, y, z, w)
    self.create_tuple(x, y, z, w)
  end

  def self.create(input : Tuple)
    self.create_tuple(*input)
  end

  private def self.create_tuple(x, y, z, w)
    if w == 1.0
      Point.new(x.to_f, y.to_f, z.to_f)
    elsif w == 0.0
      Vector.new(x.to_f, y.to_f, z.to_f)
    else
      Tuple.new(x, y, z, w)
    end
  end
end
