require "../spec_helper"

describe Color do
  it "can be created" do
    Color.new(1, 2, 3).should be_a(Color)
  end
  it "can be added to another Color" do
    c1 = Color.new(1, 2, 3)
    c2 = Color.new(2, 3, 4)
    (c1 + c2).should eq(Color.new(3, 5, 7))
  end
  it "can be subtracted from another Color" do
    c1 = Color.new(2, 3, 4)
    c2 = Color.new(1, 1, 1)
    (c1 - c2).should eq(Color.new(1, 2, 3))
  end
  it "can be multiplied by a scalar" do
    (Color.new(1, 2, 3) * 3).should eq(Color.new(3, 6, 9))
  end
  it "can be multiplied with another color (Hadamard product)" do
    (Color.new(1, 2, 3) * Color.new(2, 3, 4)).should eq(Color.new(2, 6, 12))
  end
  it "can be normalized by a specified factor" do
    Color.new(1, 1, 1).normalize.to_tuple.should eq({255, 255, 255})
    Color.new(0, 0.5, 1).normalize.to_tuple.should eq({0, 128, 255})
  end
end
