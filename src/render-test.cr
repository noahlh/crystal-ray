require "./crystal-ray/support/**"
require "./crystal-ray/core/**"

camera_origin = Point.new(0, 0, -120)
sphere = Sphere.new(radius: 100, material: Material.new(color: Color.new(0, 0.8, 1)))
light = Pointlight.new(Point.new(-150, 150, -150), Color.new(1, 1, 1))
wall_z = 10

output = File.new("/Users/nlh/Desktop/output1.ppm", "w")
c = Canvas.new(1000, 1000)
c.each_row_with_index do |row, canvas_y|
  row.each_with_index do |pixel, canvas_x|
    current_position = Point.new((canvas_x - c.width/2).to_f, (c.height/2 - canvas_y).to_f, wall_z.to_f)
    cast_ray = Ray.new(camera_origin, (current_position - camera_origin).normalize)
    if intersections = cast_ray.intersect(sphere)
      hit = intersections.hit
      point = cast_ray.position(hit.t)
      normal = hit.object.normal_at(point)
      eye = -cast_ray.direction
      color = Lighting.new(hit.object.material, light, point, eye, normal).color
      c[canvas_x, canvas_y] = color
    end
  end
end
p = PPM.new(output)
p.generate(c)
output.close
