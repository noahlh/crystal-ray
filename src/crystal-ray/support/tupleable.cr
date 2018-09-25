module Tupleable
  macro included
    def +(other)
      {{ @type }}.new(self.to_tuple + other.to_tuple)
    end

    def -(other)
      {{ @type }}.new(self.to_tuple - other.to_tuple)
    end

    def -
      {{ @type }}.new( to_tuple.map { |el| -el })
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
    def to_tuple
      {x, y, z, w}
    end

    def <=(scalar)
      to_tuple.all? {|el| el <= scalar}
    end
  end
end
