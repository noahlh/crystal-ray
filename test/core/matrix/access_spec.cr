require "../../spec_helper"

describe Matrix do
  describe "[]" do
    it "accesses an element of the matrix" do
      m = Matrix.new(
        {1, 2},
        {3, 4}
      )
      m[0, 0].should eq(1)
      m[0, 1].should eq(2)
      m[1, 0].should eq(3)
      m[1, 1].should eq(4)
    end
    it "throws an exception if trying to access an element out of bounds" do
      m = Matrix.new(
        {1, 1},
        {2, 2}
      )
      expect_raises(Exception) do
        m[2, 2]
      end
    end
  end
  describe "#rows" do
    it "returns the given row of a matrix" do
      Matrix.new(
        {1, 1, 1, 1},
        {2, 2, 2, 2},
        {3, 3, 3, 3},
        {4, 4, 4, 4}
      ).rows[0].should eq({1, 1, 1, 1})
    end
  end
  describe "#cols" do
    it "returns the columns of a matrix" do
      Matrix.new(
        {1, 2, 3},
        {2, 3, 4},
        {3, 4, 5},
        {4, 5, 6}
      ).cols.should eq({
        {1, 2, 3, 4},
        {2, 3, 4, 5},
        {3, 4, 5, 6},
      })
    end
  end
end
