require "./crystal-ray/support/**"
require "./crystal-ray/core/**"

BLUE = Color.new(0, 0, 1)
camera_origin = Point.new(0, 0, -30)
sphere = Sphere.new(Point.new(0, 0, 0), 20)
wall_z = 30

output = File.new("/Users/nlh/Desktop/output1.ppm", "w")
c = Canvas.new(1000, 1000)
c.each_row_with_index do |row, canvas_y|
  row.each_with_index do |pixel, canvas_x|
    current_position = Point.new((canvas_x - c.width/2).to_f, (c.height/2 - canvas_y).to_f, wall_z.to_f)
    cast_ray = Ray.new(camera_origin, (current_position - camera_origin).normalize)
    # puts "Rendering world space [#{canvas_x}, #{canvas_y}]"
    # puts "Casting ray from #{camera_origin} to #{current_position}"
    # puts "Cast ray is: #{cast_ray}"
    # puts "Intersect: #{cast_ray.intersect(sphere)}"
    # puts "----------------------------------------------------------"
    if cast_ray.intersect(sphere)
      c[canvas_x, canvas_y] = BLUE
    end
  end
end
p = PPM.new(output)
p.generate(c)
output.close
