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
  describe "#*" do
    it "multiplies each element by a scalar" do
      ({1.0, 2.0, 3.0, 4.0} * 3.0).should eq({3.0, 6.0, 9.0, 12.0})
      ({1.0, 2.0, 3.0, 4.0} * 0.5).should eq({0.5, 1.0, 1.5, 2.0})
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
end
