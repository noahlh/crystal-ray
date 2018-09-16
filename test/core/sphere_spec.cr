require "../spec_helper"

describe Sphere do
  it "has an origin and radius that default to 0,0,0 and 1 respectively" do
    s = Sphere.new
    s.origin.should eq(Point.new(0, 0, 0))
    s.radius.should eq(1)
  end
end
