module Tupleable
  macro included
    def +(other)
      {{ @type }}.new(self.to_tuple + other.to_tuple)
    end

    def -(other)
      {{ @type }}.new(self.to_tuple - other.to_tuple)
    end

    def *(scalar : Float64)
      {{ @type }}.new(self.to_tuple * scalar)
    end

    def *(other : {{ @type }})
      {{ @type }}.new(self.to_tuple * other.to_tuple)
    end

    def abs
      {{ @type }}.new(self.to_tuple.abs)
    end

    def self.new(input : Tuple)
      {{ @type }}.new(*input)
    end

    def map
      {{ @type }}.new( to_tuple.map { |el| yield el })
    end
  end
end

module Spacial
  macro included
    def self.new(input : Tuple)
      if input[3] == 1.0
        Point.new(input[0], input[1], input[2])
      elsif input[3] == 0.0
        Vector.new(input[0], input[1], input[2])
      else
        raise Exception.new("w is > 1, so this isn't actually a spacial.")
      end
    end

    def to_tuple
      {x, y, z, w}
    end

    def <=(scalar)
      to_tuple.all? {|el| el <= scalar}
    end

    def dot(other : Spacial)
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
  end
end
