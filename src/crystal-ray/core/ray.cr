struct Ray
  getter origin, direction

  def initialize(@origin : Point, @direction : Vector)
  end

  def position(t : Float64)
    @origin + (@direction * t)
  end

  def intersect(sphere : Sphere)
    sphere_to_ray = self.origin - sphere.origin
    a = self.direction.dot(self.direction)
    b = 2 * self.direction.dot(sphere_to_ray)
    c = sphere_to_ray.dot(sphere_to_ray) - 1
    discriminant = b * b - 4 * a * c
    if discriminant >= 0
      t1 = (-b - Math.sqrt(discriminant)) / (2 * a)
      t2 = (-b + Math.sqrt(discriminant)) / (2 * a)
      t1 < t2 ? {t1, t2} : {t2, t1}
    else
      Tuple.new
    end
  end

  def discriminant(sphere : Sphere)
    sphere_to_ray = self.origin - sphere.origin
    a = self.direction.dot(self.direction)
    b = 2 * self.direction.dot(sphere_to_ray)
    c = sphere_to_ray.dot(sphere_to_ray) - 1
    b * b - 4 * a * c
  end
end
