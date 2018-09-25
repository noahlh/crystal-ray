require "../spec_helper"

describe Sphere do
  it "has an origin and radius that default to 0,0,0 and 1 respectively" do
    s = Sphere.new
    s.origin.should eq(Point.new(0, 0, 0))
    s.radius.should eq(1)
  end
  it "has a material property" do
    s = Sphere.new
    s.material.should eq(Material.new)
  end
  describe "normal" do
    it "calculates the normal at a given point on the x axis" do
      s = Sphere.new
      s.normal_at(Point.new(1, 0, 0)).should eq(Vector.new(1, 0, 0))
    end
    it "calculates the normal at a given point on the y axis" do
      s = Sphere.new
      s.normal_at(Point.new(0, 1, 0)).should eq(Vector.new(0, 1, 0))
    end
    it "calculates the normal at a given point on the z axis" do
      s = Sphere.new
      s.normal_at(Point.new(0, 0, 1)).should eq(Vector.new(0, 0, 1))
    end
    it "calculates the normal at a non-axias point on the sphere" do
      sqrt3over3 = Math.sqrt(3)/3
      s = Sphere.new
      s.normal_at(Point.new(sqrt3over3, sqrt3over3, sqrt3over3)).should eq(Vector.new(sqrt3over3, sqrt3over3, sqrt3over3))
    end
    it "demonstrates the normal is a normalized vector" do
      sqrt3over3 = Math.sqrt(3)/3
      s = Sphere.new
      n = s.normal_at(Point.new(sqrt3over3, sqrt3over3, sqrt3over3))
      n.should eq(n.normalize)
    end
    it "calculates the normal for a sphere that's in a different spot" do
      s = Sphere.new(Point.new(0, 1, 0))
      s.normal_at(Point.new(0, 1.70711, -0.70711)).should be_close(Vector.new(0, 0.70711, -0.70711), 0.001)
    end
  end
end
