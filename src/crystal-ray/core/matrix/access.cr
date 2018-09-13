module Matrix
  module Access
    def [](x, y : Int32)
      @data[x][y]
    end

    def rows
      @data
    end

    def cols
      @data[0].map_with_index do |el, i|
        @data.map { |row| row[i] }
      end
    end
  end
end
