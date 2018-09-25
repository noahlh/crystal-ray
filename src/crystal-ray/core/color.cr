require "../support/**"

struct Color
  include Tupleable
  getter red : Float64 | Int32
  getter green : Float64 | Int32
  getter blue : Float64 | Int32

  def initialize(@red, @green, @blue)
  end

  def normalize(factor : Int32 = 255)
    red_norm = (@red * factor).round(0).to_i.clamp(0, factor)
    green_norm = (@green * factor).round(0).to_i.clamp(0, factor)
    blue_norm = (@blue * factor).round(0).to_i.clamp(0, factor)
    Color.new(red_norm, green_norm, blue_norm)
  end

  def to_tuple
    {@red, @green, @blue}
  end

  def to_ppm
    "#{red.round(0).to_i} #{green.round(0).to_i} #{blue.round(0).to_i}"
  end

  def <=(scalar)
    to_tuple.all? { |el| el <= scalar }
  end
end
