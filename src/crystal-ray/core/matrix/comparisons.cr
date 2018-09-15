module Matrix
  module Comparisons
    def all?
      each { |e| return false unless yield e }
      true
    end

    def <=(scalar)
      all? { |el| el <= scalar }
    end

    def <(scalar)
      all? { |el| el < scalar }
    end

    def >(scalar)
      all? { |el| el > scalar }
    end

    def >=(scalar)
      all? { |el| el >= scalar }
    end
  end
end
