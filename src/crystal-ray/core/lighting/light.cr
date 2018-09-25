struct Pointlight
  getter position, intensity

  def initialize(@position : Point, @intensity : Color)
  end
end

struct Lighting
  getter material, light, position, eye_vector, normal_vector

  def initialize(@material : Material, @light : Pointlight, @position : Point, @eye_vector : Vector, @normal_vector : Vector)
  end

  def color
    effective_color = @material.color * @light.intensity
    light_vector = (@light.position - @position).normalize
    ambient = effective_color * material.ambient
    light_dot_normal = light_vector.dot(normal_vector)

    if light_dot_normal < 0
      diffuse = Color.new(0, 0, 0)
      specular = Color.new(0, 0, 0)
    else
      diffuse = effective_color * material.diffuse * light_dot_normal
      reflect_vector = -light_vector.reflect(normal_vector)
      reflect_dot_eye = reflect_vector.dot(eye_vector) ** material.shininess
      if reflect_dot_eye <= 0
        specular = Color.new(0, 0, 0)
      else
        specular = light.intensity * material.specular * reflect_dot_eye
      end
    end
    return ambient + diffuse + specular
  end
end
