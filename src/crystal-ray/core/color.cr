require "../support/**"

struct Color
  include Tupleable
  getter red, green, blue

  def initialize(@red : Float64, @green : Float64, @blue : Float64)
  end

  def normalize(factor : Int32 = 255)
    Color.new((factor * @red).round(0), (factor * @green).round(0), (factor * @blue).round(0))
  end

  def to_tuple
    {@red, @green, @blue}
  end

  def to_ppm
    "#{red.round(0).to_i} #{green.round(0).to_i} #{blue.round(0).to_i}"
  end
end
