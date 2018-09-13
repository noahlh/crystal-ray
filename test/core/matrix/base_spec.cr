require "../../spec_helper"

describe Matrix do
  describe "initialize" do
    it "creates a arbitrary-sized Matrix from a sequence of tuples" do
      m = Matrix.new(
        {1, 2},
        {3, 4}
      )
      m.should be_a(Matrix::Base(Tuple(Int32, Int32), Tuple(Int32, Int32)))
    end
  end
end
