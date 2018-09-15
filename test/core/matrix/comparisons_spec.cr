require "../../spec_helper"

describe Matrix::Comparisons do
  describe "<=" do
    it "Returns true if all elements are <= a scalar" do
      (Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ) <= 3).should be_true
      (Matrix.new(
        {1, 1, 1},
        {2, 2, 2},
        {3, 3, 3}
      ) <= 2).should be_false
    end
  end
end
