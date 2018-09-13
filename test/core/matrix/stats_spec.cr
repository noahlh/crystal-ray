require "../../spec_helper"

describe Matrix do
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
  describe "num_rows" do
    it "should calculate the number of rows in a matrix" do
      Matrix.new(
        {1, 1, 1},
        {1, 1, 1}
      ).num_rows.should eq(2)
    end
  end
  describe "num_cols" do
    it "should calculate the number of columns in a matrix" do
      Matrix.new(
        {1, 2, 3, 4, 5, 6},
        {1, 2, 3, 4, 5, 6}
      ).num_cols.should eq(6)
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
end
