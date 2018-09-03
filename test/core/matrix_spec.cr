require "../spec_helper"

describe Matrix do
  describe "initialize" do
    it "creates a arbitrary-sized Matrix from a sequence of tuples" do
      m = Matrix.new(
        {1, 2},
        {3, 4}
      )
      m.should be_a(Matrix(Tuple(Int32, Int32), Tuple(Int32, Int32)))
    end
  end
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
        m[3, 3]
      end
    end
  end
  describe "size" do
    it "should calculate the size of a square matrix" do
      Matrix.new(
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
      ).size.should eq(4)
    end
  end
  describe "*" do
    it "should multiple two matrices together" do
      m1 = Matrix.new(
        {1, 2, 3, 4},
        {2, 3, 4, 5},
        {3, 4, 5, 6},
        {4, 5, 6, 7}
      )
      m2 = Matrix.new(
        {0, 1, 2, 4},
        {1, 2, 4, 8},
        {2, 4, 8, 16},
        {4, 8, 16, 32}
      )
      (m1 * m2).should eq(Matrix.new(
        {24, 49, 98, 196},
        {31, 64, 128, 256},
        {38, 79, 158, 316},
        {45, 94, 188, 376}))
    end
  end
end
