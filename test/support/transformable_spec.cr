require "../../spec_helper"

describe Transformable do
  describe "translate" do
    it "translates a point by a given translation matrix" do
      Point.new(-3, 4, 5).translate(5, -3, 2).should eq(Point.new(2, 1, 7))
    end
    it "doesn't translate a vector" do
      Vector.new(-3, 4, 5).translate(5, -3, 2).should eq(Vector.new(-3, 4, 5))
    end
  end
  describe "scale" do
    it "scales a point" do
      Point.new(-4, 6, 8).scale(2, 3, 4).should eq(Point.new(-8, 18, 32))
    end
    it "scales a vector" do
      Vector.new(-4, 6, 8).scale(2, 3, 4).should eq(Vector.new(-8, 18, 32))
    end
    it "reflection is scaling by a negative value" do
      Point.new(2, 3, 4).scale(-1, 1, 1).should eq(Point.new(-2, 3, 4))
    end
  end
  describe "rotate_x" do
    it "rotates a point around the x axis" do
      Point.new(0, 1, 0).rotate_x(Math::PI / 2).should be_close(Point.new(0, 0, 1), 0.001)
    end
  end
  describe "rotate_y" do
    it "rotates a point around the y axis" do
      Point.new(0, 0, 1).rotate_y(Math::PI / 2).should be_close(Point.new(1, 0, 0), 0.001)
    end
  end
  describe "rotate_z" do
    it "rotates a point around the z axis" do
      Point.new(0, 1, 0).rotate_z(Math::PI / 2).should be_close(Point.new(-1, 0, 0), 0.001)
    end
  end
  describe "#shear" do
    it "moves x in proportion to y" do
      Point.new(2, 3, 4).shear(1, 0, 0, 0, 0, 0).should eq(Point.new(5, 3, 4))
    end
    it "moves x in proportion to z" do
      Point.new(2, 3, 4).shear(0, 1, 0, 0, 0, 0).should eq(Point.new(6, 3, 4))
    end
    it "moves y in proportion to x" do
      Point.new(2, 3, 4).shear(0, 0, 1, 0, 0, 0).should eq(Point.new(2, 5, 4))
    end
    it "moves y in proportion to z" do
      Point.new(2, 3, 4).shear(0, 0, 0, 1, 0, 0).should eq(Point.new(2, 7, 4))
    end
    it "moves z in proportion to x" do
      Point.new(2, 3, 4).shear(0, 0, 0, 0, 1, 0).should eq(Point.new(2, 3, 6))
    end
    it "moves z in proportion to y" do
      Point.new(2, 3, 4).shear(0, 0, 0, 0, 0, 1).should eq(Point.new(2, 3, 7))
    end
  end
  describe "chaining transforms" do
    it "applies individual transmations in sequence" do
      Point.new(1, 0, 1).rotate_x(Math::PI / 2).scale(5, 5, 5).translate(10, 5, 7).should eq(Point.new(15, 0, 7))
    end
  end
end
