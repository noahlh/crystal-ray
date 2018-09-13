require "./**"

module Matrix
  def self.new(*args)
    Base.new(*args)
  end

  struct Base(*T)
    include Matrix::Operators
    include Matrix::Linear
    include Matrix::Access
    include Matrix::Stats
    include Matrix::Transforms

    @data : *T

    def initialize(*input : *T)
      @data = input
    end
  end
end
