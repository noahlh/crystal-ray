require "../spec_helper"

struct TestTuple
  include Tupleable
  getter a, b

  def initialize(@a : Float64, @b : Float64)
  end

  def to_tuple
    {@a, @b}
  end
end

struct TestSpacial
  include Tupleable
  include Spacial

  getter x, y, z, w

  def initialize(@x : Float64, @y : Float64, @z : Float64, @w : Float64)
  end
end

describe Tupleable do
  describe "#+" do
    it "adds two Tupleables together" do
      t1 = TestTuple.new(1, 2)
      t2 = TestTuple.new(1, 2)
      (t1 + t2).should eq(TestTuple.new(2, 4))
    end
  end
  describe "#-" do
    it "subtracts two Tupleables from each other" do
      t1 = TestTuple.new(5, 7)
      t2 = TestTuple.new(3, 2)
      (t1 - t2).should eq(TestTuple.new(2, 5))
    end
  end
  describe "map" do
    it "maps an existing object's items to a new object" do
      t1 = TestTuple.new(5, 7)
      t2 = t1.map { |el| el + 1 }
      t2.should eq(TestTuple.new(6, 8))
    end
  end
end

describe Spacial do
  describe "#from_tuple" do
    it "should create a point when w = 1" do
      TestSpacial.new({1.0, 1.0, 1.0, 1.0}).should eq(Point.new(1, 1, 1))
    end
    it "should create a vector when w = 0" do
      TestSpacial.new({1.0, 1.0, 1.0, 0.0}).should eq(Vector.new(1, 1, 1))
    end
    it "should throw an exception when w > 1" do
      expect_raises(Exception) do
        TestSpacial.new({1.0, 1.0, 1.0, 2.0})
      end
    end
  end
  describe "#to_tuple" do
    it "should create a tuple representation of itself" do
      TestSpacial.new(1, 2, 3, 4).to_tuple.should eq({1, 2, 3, 4})
    end
  end
end
