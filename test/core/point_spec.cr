require "../spec_helper"

describe Point do
  it "is a Point" do
    a = Point.new
    a.should be_a(Point)
  end
  it "is a Point when initialized with values" do
    a = Point.new(1.0, 2.0, 3.0)
    a.should be_a(Point)
  end
  it "has w which defaults to 1.0" do
    a = Point.new
    a.w.should eq(1.0)
  end
  it "can be created with 3 arguments" do
    a = Point.new(1.0, 2.0, 3.0)
    a.x.should eq(1.0)
    a.y.should eq(2.0)
    a.z.should eq(3.0)
    a.w.should eq(1.0)
  end
end
