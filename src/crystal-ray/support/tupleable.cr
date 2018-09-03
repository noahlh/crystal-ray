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

    def self.new(input : Tuple)
      {{ @type }}.new(*input)
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
        input
      end
    end

    def to_tuple
      {x, y, z, w}
    end
  end
end
