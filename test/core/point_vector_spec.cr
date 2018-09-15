require "../spec_helper"

describe "adding & subtracting Points and Vectors" do
  describe "#+" do
    it "adds two vectors to result in another vector" do
      v1 = Vector.new(1, 1, 1)
      v2 = Vector.new(2, 2, 2)
      (v1 + v2).should eq(Vector.new(3, 3, 3))
    end
    it "adds a vector to a point to result in another point" do
      v = Vector.new(1, 1, 1)
      p = Point.new(1, 1, 1)
      (v + p).should eq(Point.new(2, 2, 2))
    end
    it "adding two points doesn't make sense so it throws an exception" do
      p1 = Point.new(1, 1, 1)
      p2 = Point.new(1, 1, 1)
      expect_raises(Exception) do
        (p1 + p2)
      end
    end
  end
  describe "#-" do
    it "subtracts two points to result in a vector" do
      p1 = Point.new(3, 2, 1)
      p2 = Point.new(5, 6, 7)
      (p1 - p2).should eq(Vector.new(-2, -4, -6))
    end
    it "subtracts a vector from a point to result in a point" do
      p = Point.new(3, 2, 1)
      v = Vector.new(5, 6, 7)
      (p - v).should eq(Point.new(-2, -4, -6))
    end
    it "subtracts two vectors to results in another vector" do
      v1 = Vector.new(3, 2, 1)
      v2 = Vector.new(5, 6, 7)
      (v1 - v2).should eq(Vector.new(-2, -4, -6))
    end
  end
end
