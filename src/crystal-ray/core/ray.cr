require "../support/transformable.cr"

struct Ray
  include Transformable
  getter origin, direction

  def initialize(@origin : Point, @direction : Vector)
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
      return nil
    else
      thc = Math.sqrt((sphere.radius ** 2) - d2)
      t1 = tca - thc
      t2 = tca + thc
      it1 = Intersection.new(t1, sphere)
      it2 = Intersection.new(t2, sphere)
      t1 < t2 ? Intersections.new(it1, it2) : Intersections.new(it2, it1)
    end
  end

  def transform(transform_matrix)
    Ray.new(transform_matrix * @origin.to_tuple, transform_matrix * @direction.to_tuple)
  end
end
