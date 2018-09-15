module Transformable
  macro included
    def transform(transform_matrix)
      {{ @type }}.new(transform_matrix * to_tuple)
    end
    def translate(x, y, z)
      translate_matrix = Matrix.new(
        {1, 0, 0, x},
        {0, 1, 0, y},
        {0, 0, 1, z},
        {0, 0, 0, 1})
      transform(translate_matrix)
    end
    def scale(x, y, z)
      scale_matrix = Matrix.new(
        {x, 0, 0, 0},
        {0, y, 0, 0},
        {0, 0, z, 0},
        {0, 0, 0, 1})
      transform(scale_matrix)
    end
    def rotate_x(rad)
      rotate_x_matrix = Matrix.new(
        {1, 0, 0, 0},
        {0, Math.cos(rad), -Math.sin(rad), 0},
        {0, Math.sin(rad), Math.cos(rad), 0},
        {0, 0, 0, 1})
      transform(rotate_x_matrix)
    end
    def rotate_y(rad)
      rotate_y_matrix = Matrix.new(
        { Math.cos(rad), 0, Math.sin(rad), 0 },
        {0,1,0,0},
        {-Math.sin(rad), 0, Math.cos(rad), 0},
        {0,0,0,1}
      )
      transform(rotate_y_matrix)
    end
    def rotate_z(rad)
      rotate_z_matrix = Matrix.new(
        {Math.cos(rad), -Math.sin(rad),0,0},
        {Math.sin(rad), Math.cos(rad),0,0},
        {0,0,1,0},
        {0,0,0,1}
      )
      transform(rotate_z_matrix)
    end
    def shear(xy, xz, yx, yz, zx, zy)
      shear_matrix = Matrix.new(
        {1, xy, xz, 0},
        {yx, 1, yz, 0},
        {zx, zy, 1, 0},
        {0, 0, 0, 1}
      )
      transform(shear_matrix)
    end
  end
end
