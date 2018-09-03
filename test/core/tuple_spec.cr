require "../spec_helper"

describe Tuple do
  describe "#+" do
    it "adds two tuples together" do
      ({1, 1, 1, 1} + {1, 1, 1, 1}).should eq({2, 2, 2, 2})
    end
  end
  describe "#-" do
    it "subtracts two tuples from each other" do
      ({3, 2, 1, 1} - {5, 6, 7, 1}).should eq({-2, -4, -6, 0})
    end
  end
  describe "#* (scalar)" do
    it "multiplies each element by a scalar" do
      ({1.0, 2.0, 3.0, 4.0} * 3.0).should eq({3.0, 6.0, 9.0, 12.0})
      ({1.0, 2.0, 3.0, 4.0} * 0.5).should eq({0.5, 1.0, 1.5, 2.0})
    end
  end
  describe "#* (tuple)" do
    it "multiplies each element by the corresponding element in the other tuple" do
      ({1, 2, 3} * {2, 3, 4}).should eq({2, 6, 12})
    end
  end
  describe "#/" do
    it "divides each element by a scalar" do
      ({1, -2, 3, -4} / 2).should eq({0.5, -1, 1.5, -2})
    end
  end
  describe "-" do
    it "negates a tuple" do
      (-{1, 1, 1, 1}).should eq({-1, -1, -1, -1})
    end
  end
  describe "sum" do
    it "reduces a tuple to be the sum of its elements" do
      {1, 2, 3, 4}.sum.should eq(10)
    end
  end
  describe "dot" do
    it "calculates the dot product of two tuples" do
      {1, 2, 3, 4}.dot({2, 3, 4, 5}).should eq(40)
    end
  end
end
