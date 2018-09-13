require "../../spec_helper"

describe Matrix do
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
    it "can multiple a matrix by its inverse to get another matrix" do
      a = Matrix.new(
        {3, -9, 7, 3},
        {3, -8, 2, -9},
        {-4, 4, 4, 1},
        {-6, 5, -1, 1}
      )
      b = Matrix.new(
        {8, 2, 2, 2},
        {3, -1, 7, 0},
        {7, 9, 5, 4},
        {6, -2, 0, 5}
      )
      c = a * b
      (c * b.inverse).should be_close(a, 0.001)
    end
  end
end
