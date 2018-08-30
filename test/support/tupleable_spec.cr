require "../spec_helper"

class TestTuple
  include RayTupleable
end

describe RayTupleable do
  it "has getters for x, y, z, w" do
    t = TestTuple.new(1.0, 2.0, 3.0, 4.0)
    t.x.should eq(1.0)
    t.y.should eq(2.0)
    t.z.should eq(3.0)
    t.w.should eq(4.0)
  end
  describe "#to_tuple" do
    it "returns a Tuple version of a RayTupleable" do
      t = TestTuple.new(1.0, 2.0, 3.0, 4.0)
      t.to_tuple.should eq({1.0, 2.0, 3.0, 4.0})
    end
  end
end
