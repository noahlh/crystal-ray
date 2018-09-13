module Matrix
  module Linear
    def submatrix(row_to_del, col_to_del)
      {% begin %}
          {% current_size = @type.type_vars.first.size %}
          rows_to_keep = (0..{{current_size - 1}}).reject { |i| i == row_to_del }
          cols_to_keep = (0..{{current_size - 1}}).reject { |i| i == col_to_del }
          Matrix.new(
            {% for r in (0...(current_size - 1)) %}
              {
                {% for c in (0...(current_size - 1)) %}
                  @data[rows_to_keep[{{r}}]][cols_to_keep[{{c}}]],
                {% end %}
              },
            {% end %}
          )
        {% end %}
    end

    def minor(row, col)
      submatrix(row, col).determinant
    end

    def cofactor(row, col)
      (-1 ** (row + col)) * minor(row, col)
    end

    def determinant
      data = @data
      first_row = data.first?

      if (data.size == 0)
        0
      elsif (data.size == 1)
        if first_row
          first_row[0]
        else
          0
        end
      else
        if first_row
          (0...num_cols).reduce(0) do |acc, i|
            acc + (first_row[i] * cofactor(0, i))
          end
        else
          0
        end
      end
    end

    def cofactor_matrix
      Matrix.new(
        *rows.map_with_index do |r, ri|
          r.map_with_index do |c, ci|
            cofactor(ri, ci)
          end
        end
      )
    end

    def inverse
      (cofactor_matrix.transpose / determinant)
    end
  end
end
