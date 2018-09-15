require "./**"

module Matrix
  def self.new(*args)
    Base.new(*args)
  end

  struct Base(*T)
    include Matrix::Operators
    include Matrix::Comparisons
    include Matrix::Linear
    include Matrix::Access
    include Matrix::Stats
    include Matrix::Modify

    @data : *T

    def initialize(*input : *T)
      @data = input
    end
  end
end
