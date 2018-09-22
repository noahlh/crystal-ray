require "../spec_helper"

describe Intersection do
  it "has a t intersection point and a sphere being intersected" do
    s = Sphere.new
    i = Intersection.new(3.5, s)
    i.t.should eq(3.5)
    i.object.should eq(s)
  end
end

describe Intersections do
  it "creates a collection of Intersections" do
    s = Sphere.new
    i1 = Intersection.new(3, s)
    i2 = Intersection.new(2, s)
    i3 = Intersection.new(-1, s)

    ix = Intersections.new(i1, i2, i3)
    ix.should be_a(Intersections)
    ix.size.should eq(3)
    ix[0].should eq(i1)
  end
  describe "hit" do
    it "returns the 'hit' intersection" do
      s = Sphere.new
      i1 = Intersection.new(3, s)
      i2 = Intersection.new(2, s)
      i3 = Intersection.new(-1, s)

      ix = Intersections.new(i1, i2, i3)
      ix.hit.should eq(i2)
    end
  end
end
