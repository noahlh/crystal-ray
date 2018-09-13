require "../../spec_helper"

describe Matrix do
  describe "to_tuple" do
    it "should convert a 1xn matrix to a tuple" do
      Matrix.new({1}, {2}, {3}, {4}).to_tuple.should eq({1, 2, 3, 4})
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
  describe "map" do
    it "should pass a block and map items to each element in a matrix" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).map { |el| el + 1 }.should eq(
        Matrix.new(
          {2, 2, 2},
          {3, 3, 3},
          {4, 4, 4}
        )
      )
    end
  end
  describe "map_with_index" do
    it "should pass a block and map items to each element with index" do
      Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ).map_with_index { |el, el_idx, r_idx| {el, el_idx, r_idx} }.should eq(
        Matrix.new(
          { {1, 0, 0}, {1, 1, 0}, {1, 2, 0} },
          { {2, 0, 1}, {2, 1, 1}, {2, 2, 1} },
          { {3, 0, 2}, {3, 1, 2}, {3, 2, 2} }
        )
      )
    end
  end
end
