require "../spec_helper"

describe Vector do
  it "is a Vector" do
    a = Vector.new
    a.should be_a(Vector)
  end
  it "has w which defaults to 0.0" do
    a = Vector.new
    a.w.should eq(0.0)
  end
  it "can be created with 3 arguments" do
    a = Vector.new(1.0, 2.0, 3.0)
    a.x.should eq(1.0)
    a.y.should eq(2.0)
    a.z.should eq(3.0)
    a.w.should eq(0.0)
  end
  describe "#magnitude" do
    it "calculates the magnitude" do
      Vector.new(1, 0, 0).magnitude.should eq(1)
      Vector.new(0, 1, 0).magnitude.should eq(1)
      Vector.new(0, 0, 1).magnitude.should eq(1)
      Vector.new(1, 2, 3).magnitude.should eq(Math.sqrt(14))
      Vector.new(-1, -2, -3).magnitude.should eq(Math.sqrt(14))
    end
  end
  describe "#normalize" do
    it "normalizes the vector" do
      Vector.new(4, 0, 0).normalize.should eq(Vector.new(1, 0, 0))
      Vector.new(1, 2, 3).normalize.should eq(Vector.new(1/Math.sqrt(14), 2/Math.sqrt(14), 3/Math.sqrt(14)))
    end
    it "normalizes a vector to magnitude 1" do
      Vector.new(1, 2, 3).normalize.magnitude.should eq(1)
    end
  end
  describe "#dot" do
    it "calculates the dot product of two vectors" do
      (Vector.new(1, 2, 3).dot Vector.new(2, 3, 4)).should eq(20)
    end
  end
  describe "#cross" do
    it "calculates the cross product of two vectors" do
      (Vector.new(1, 2, 3).cross Vector.new(2, 3, 4)).should eq(Vector.new(-1, 2, -1))
      (Vector.new(2, 3, 4).cross Vector.new(1, 2, 3)).should eq(Vector.new(1, -2, 1))
    end
  end
end
