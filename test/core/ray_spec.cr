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
    it "calculates an intersection of the ray & sphere returns a tuple of t values" do
      r = Ray.new(Point.new(0, 0, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq({4, 6})
    end
    it "calculates an intersection @ the top of the sphere" do
      r = Ray.new(Point.new(0, 1, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq({5, 5})
    end
    it "calculates an intersection that misses the sphere" do
      r = Ray.new(Point.new(0, 2, -5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq(Tuple.new)
    end
    it "calculates an intersection w/ a ray that originates inside the sphere" do
      r = Ray.new(Point.new(0, 0, 0), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq({-1, 1})
    end
    it "calculates an intersection w/ a ray that originates in front of the sphere" do
      r = Ray.new(Point.new(0, 0, 5), Vector.new(0, 0, 1))
      s = Sphere.new
      r.intersect(s).should eq({-6, -4})
    end
  end
end
