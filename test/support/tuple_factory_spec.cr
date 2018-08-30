require "../spec_helper"

describe TupleFactory do
  describe "#create" do
    it "creates a Point from elements when w == 1.0" do
      t = TupleFactory.create(1, 2, 3, 1)
      t.should be_a(Point)
    end
    it "creates a Point from a tuple when w == 1.0" do
      t = TupleFactory.create({1, 2, 3, 1})
      t.should be_a(Point)
    end
    it "creates a Vector when w == 0.0" do
      t = TupleFactory.create(1, 2, 3, 0)
      t.should be_a(Vector)
    end
    it "passes-through a tuple when w != 1 and != 0" do
      t = TupleFactory.create(1.0, 2.0, 3.0, 4.0)
      t.should be_a(Tuple(Float64, Float64, Float64, Float64))
      t.should eq({1.0, 2.0, 3.0, 4.0})
    end
  end
end
