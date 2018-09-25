struct Material
  getter color : Color
  getter ambient
  getter diffuse
  getter specular
  getter shininess

  def initialize(@color = Color.new(1, 1, 1), @ambient = 0.1, @diffuse = 0.9, @specular = 0.9, @shininess = 200)
  end
end
