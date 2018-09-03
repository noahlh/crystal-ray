require "./crystal-ray/support/**"
require "./crystal-ray/core/**"

output = File.new("/Users/nlh/Desktop/output.ppm", "w")
c = Canvas.new(800, 600)
c.each_row_with_index do |row, y|
  row.each_with_index do |pixel, x|
    c[x, y] = Color.new(0.5, 1, 0)
  end
end
p = PPM.new(output)
p.generate(c)
output.close
