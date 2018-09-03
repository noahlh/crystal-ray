require "./canvas"

class PPM
  @last_newline = false

  def initialize(@io : IO = STDOUT)
  end

  def generate(canvas : Canvas = Canvas.new(1, 1))
    write_header(canvas)
    write_body(canvas)
  end

  def write_header(canvas)
    @io.puts "P3"
    @io.puts "#{canvas.width} #{canvas.height}"
    @io.puts "255"
  end

  def write_body(canvas)
    canvas.each_row do |row|
      row.each_with_index do |pixel, i|
        norm = pixel.normalize(255)
        @io.printf("%3d %3d %3d ", norm.red, norm.green, norm.blue)
        !!(@last_newline = ((i + 1) % 5 == 0)) ? @io.print("\n") : nil
      end
      @io.print "\n" unless @last_newline
    end
    @io.print "\n"
  end
end
