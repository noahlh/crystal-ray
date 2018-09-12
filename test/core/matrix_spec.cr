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
  describe "size" do
    it "should calculate the size (num rows) of a square matrix" do
      Matrix.new(
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
      ).size.should eq(4)
    end
  end
  describe "square?" do
    it "should be true if a matrix is square and false otherwise" do
      Matrix.new(
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
      ).square?.should be_true
      Matrix.new(
        {1, 2, 3},
        {4, 5, 6}
      ).square?.should be_false
    end
  end
  describe "to_tuple" do
    it "should convert a 1xn matrix to a tuple" do
      Matrix.new({1}, {2}, {3}, {4}).to_tuple.should eq({1, 2, 3, 4})
    end
  end
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
  describe "/ (scalar)" do
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
    it "should subtract a scalar from each element of a matrix" do
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
  end
  describe "transpose" do
    it "should transpose a matrix's rows and columns" do
      Matrix.new(
        {0, 9, 3, 0},
        {9, 8, 0, 8},
        {1, 8, 5, 3},
        {0, 0, 5, 8}
      ).transpose.should eq(
        Matrix.new(
          {0, 9, 1, 0},
          {9, 8, 8, 0},
          {3, 0, 5, 5},
          {0, 8, 3, 8}
        )
      )
    end
  end
  describe "#minor" do
    it "should calculate the minor of a matrix with row/col eliminated" do
      Matrix.new(
        {1, 4, 7},
        {3, 0, 5},
        {-1, 9, 11}
      ).minor(1, 2).should eq(13)
    end
  end
  describe "cofactor" do
    it "should calc the cofactor of a matrix with given row/col elimination" do
      Matrix.new(
        {1, 4, 7},
        {3, 0, 5},
        {-1, 9, 11}
      ).cofactor(1, 2).should eq(-13)
    end
  end
  describe "determinant" do
    it "calculates the 'identity' determinant of a single element as itself" do
      Matrix.new(
        {5}
      ).determinant.should eq(5)
    end
    it "recursively calculates the determinant (via Laplace expansion) - 2x2" do
      Matrix.new(
        {1, 5},
        {-3, 2}
      ).determinant.should eq(17)
    end
    it "calculates the determinant - 3x3" do
      Matrix.new(
        {1, 2, 6},
        {-5, 8, -4},
        {2, 6, 4}
      ).determinant.should eq(-196)
    end
    it "calculates the determinant - 4x4" do
      Matrix.new(
        {-2, -8, 3, 5},
        {-3, 1, 7, 3},
        {1, 2, -9, 6},
        {-6, 7, 7, -9}
      ).determinant.should eq(-4071)
    end
  end
  describe "submatrix" do
    it "should extract a 3x3 matrix from a 4x4" do
      Matrix.new(
        {1, 2, 3, 4},
        {5, 6, 7, 8},
        {9, 10, 11, 12},
        {13, 14, 15, 16}
      ).submatrix(1, 2).should eq(
        Matrix.new(
          {1, 2, 4},
          {9, 10, 12},
          {13, 14, 16}
        )
      )
    end
    it "should extract a 2x2 matrix from a 3x3" do
      Matrix.new(
        {1, 2, 3},
        {4, 5, 6},
        {7, 8, 9}
      ).submatrix(1, 2).should eq(
        Matrix.new(
          {1, 2},
          {7, 8}
        )
      )
    end
  end
  describe "cofactor matrix" do
    it "calcuates the cofactor matrix of a given matrix" do
      Matrix.new(
        {-5, 2, 6, -8},
        {1, -5, 1, 8},
        {7, 7, -6, -7},
        {1, -3, 7, 4}
      ).cofactor_matrix.should eq(
        Matrix.new(
          {116, -430, -42, -278},
          {240, -775, -119, -433},
          {128, -236, -28, -160},
          {-24, 277, 105, 163}
        )
      )
    end
  end
  describe "invertible?" do
    it "uses the determinant to calculate whether a matrix is invertible" do
      Matrix.new(
        {6, 4, 4, 4},
        {5, 5, 7, 6},
        {4, -9, 3, -7},
        {9, 1, 7, -6}
      ).invertible?.should be_true
      Matrix.new(
        {-4, 2, -2, -3},
        {9, 6, 2, 6},
        {0, -5, 1, -5},
        {0, 0, 0, 0}
      ).invertible?.should be_false
    end
  end
  describe "inverse" do
    it "calculates the inverse of a matrix" do
      Matrix.new(
        {8, -5, 9, 2},
        {7, 5, 6, 1},
        {-6, 0, 9, 6},
        {-3, 0, -9, -4}
      ).inverse.should be_close(
        Matrix.new(
          {-0.15385, -0.15385, -0.28205, -0.53846},
          {-0.07692, 0.12308, 0.02564, 0.03077},
          {0.35897, 0.35897, 0.43590, 0.92308},
          {-0.69231, -0.69231, -0.76923, -1.92308}
        ), 0.001)
    end
  end
end
