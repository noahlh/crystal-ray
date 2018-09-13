require "../../spec_helper"

describe Matrix do
  describe "* (Matrix)" do
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
    it "should equal itself when multiplying by the identity matrix" do
      m1 = Matrix.new(
        {0, 1, 2, 4},
        {1, 2, 4, 8},
        {2, 4, 8, 16},
        {4, 8, 16, 32}
      )
      identity = Matrix.new(
        {1, 0, 0, 0},
        {0, 1, 0, 0},
        {0, 0, 1, 0},
        {0, 0, 0, 1}
      )
      (m1 * identity).should eq(m1)
    end
  end
  describe "* (Tuple)" do
    it "should multiple a matrix by a tuple and return a tuple" do
      mt = Matrix.new(
        {1, 2, 3, 4},
        {2, 4, 4, 2},
        {8, 6, 4, 1},
        {0, 0, 0, 1}
      ) * {1, 2, 3, 1}
      mt.should eq({18, 24, 33, 1})
    end
  end
  describe "/" do
    it "divides each element of a matrix by a scalar" do
      (Matrix.new(
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
      ) / 4).should eq(
        Matrix.new(
          {0.25, 0.5, 0.75, 1.0},
          {1.25, 1.5, 1.75, 2.0},
          {2.25, 2.5, 2.75, 3.0},
          {3.25, 3.5, 3.75, 4.0}
        ))
    end
  end
  describe "-" do
    it "should subtract one matrix from another" do
      (Matrix.new(
        {4, 4, 4},
        {3, 3, 3},
        {2, 2, 2}
      ) - Matrix.new(
        {1, 1, 1},
        {1, 1, 1},
        {1, 1, 1}
      )).should eq(
        Matrix.new(
          {3, 3, 3},
          {2, 2, 2},
          {1, 1, 1}
        )
      )
    end
    it "should subtract a scalar from a matrix" do
      (Matrix.new(
        {2, 2, 2},
        {3, 3, 3},
        {4, 4, 4}
      ) - 1).should eq(
        Matrix.new(
          {1, 1, 1},
          {2, 2, 2},
          {3, 3, 3}
        )
      )
    end
  end
  describe "<=" do
    it "should compare each element in a matrix and determine if all are <=" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).should be <= 3
    end
  end
  describe "<" do
    it "should compare each element in a matrix and determine if all are <=" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).should be < 4
    end
  end
  describe ">=" do
    it "should compare each element in a matrix and determine if all are <=" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).should be >= 1
    end
  end
  describe ">" do
    it "should compare each element in a matrix and determine if all are <=" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).should be > 0
    end
  end
end
