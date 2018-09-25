require "../support/transformable.cr"

struct Ray
  include Transformable
  getter origin, direction

  def initialize(@origin : Spacial, @direction : Spacial)
  end

  def initialize(origin : Tuple, direction : Tuple)
    @origin = Point.new(origin)
    @direction = Vector.new(direction)
  end

  def position(t : Float64)
    @origin + (@direction * t)
  end

  def intersect(sphere : Sphere)
    l = sphere.origin - self.origin
    tca = l.dot(self.direction)
    d2 = (l.dot(l)) - (tca ** 2)
    if d2 > (sphere.radius ** 2) # if d2 > radius2, then the ray misses the sphere and there's no intersection
      return false
    else
      thc = Math.sqrt((sphere.radius ** 2) - d2)
      t1 = tca - thc
      t2 = tca + thc
      t1 < t2 ? {Intersection.new(t1, sphere), Intersection.new(t2, sphere)} : {Intersection.new(t2, sphere), Intersection.new(t1, sphere)}
    end
  end

  def transform(transform_matrix)
    Ray.new(transform_matrix * @origin.to_tuple, transform_matrix * @direction.to_tuple)
  end
end
