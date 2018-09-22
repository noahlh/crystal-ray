require "./sphere.cr"

struct Intersection
  getter t : Float64
  getter object : Sphere

  def initialize(@t : Float64, @object)
  end
end

struct Intersections
  include Indexable(Intersection)
  getter data : Array(Intersection)

  def initialize(*input)
    @data = [] of Intersection
    input.each do |i|
      @data << i
    end
  end

  def size
    @data.size
  end

  def unsafe_at(index : Int)
    @data[index]
  end

  def hit : Intersection
    @data.min_by { |el| el.t > 0 ? el.t : Float64::MAX }
  end
end
