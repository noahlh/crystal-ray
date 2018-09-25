require "../spec_helper"

describe Ray do
  it "can be created with an origin and a direction" do
    o = Point.new(1, 1, 1)
    d = Vector.new(2, 2, 2)
    Ray.new(origin: o, direction: d).should be_a(Ray)
  end
  it "can access origin and direction via properties" do
    o = Point.new(1, 1, 1)
    d = Vector.new(2, 2, 2)
    r = Ray.new(o, d)
    r.origin.should eq(Point.new(1, 1, 1))
    r.direction.should eq(Vector.new(2, 2, 2))
  end
  describe "#position" do
    it "calculates the position given input time/distance t" do
      r = Ray.new(origin: Point.new(2, 3, 4), direction: Vector.new(1, 0, 0))
      r.position(0).should eq(Point.new(2, 3, 4))
      r.position(1).should eq(Point.new(3, 3, 4))
      r.position(-1).should eq(Point.new(1, 3, 4))
      r.position(2.5).should eq(Point.new(4.5, 3, 4))
    end
  end
  describe "#intersect" do
    it "calculates an intersection of the ray & sphere returns a tuple of intersections" do
      r = Ray.new(Point.new(0, 0, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq(Intersections.new(Intersection.new(4, s), Intersection.new(6, s)))
    end
    it "calculates an intersection @ the top of the sphere" do
      r = Ray.new(Point.new(0, 1, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq(Intersections.new(Intersection.new(5, s), Intersection.new(5, s)))
    end
    it "calculates an intersection that misses the sphere" do
      r = Ray.new(Point.new(0, 2, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should be_nil
    end
    it "calculates an intersection w/ a ray that originates inside the sphere" do
      r = Ray.new(Point.new(0, 0, 0), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq(Intersections.new(Intersection.new(-1, s), Intersection.new(1, s)))
    end
    it "calculates an intersection w/ a ray that originates in front of the sphere" do
      r = Ray.new(Point.new(0, 0, 5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq(Intersections.new(Intersection.new(-6, s), Intersection.new(-4, s)))
    end
  end
  describe "transform" do
    it "translates a ray into another ray" do
      r = Ray.new(Point.new(1, 2, 3), Vector.new(0, 1, 0))
      r.translate(3, 4, 5).should eq(Ray.new(Point.new(4, 6, 8), Vector.new(0, 1, 0)))
    end
    it "scales a ray into another ray" do
      r = Ray.new(Point.new(1, 2, 3), Vector.new(0, 1, 0))
      r.scale(2, 3, 4).should eq(Ray.new(Point.new(2, 6, 12), Vector.new(0, 3, 0)))
    end
  end
end
