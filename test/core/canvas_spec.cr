require "../spec_helper"

class TestCanvas < Canvas
  property data
end

describe Canvas do
  it "has width & height properties" do
    c = Canvas.new(10, 20)
    c.width.should eq(10)
    c.height.should eq(20)
  end
  it "creates an array of arrays" do
    c = TestCanvas.new(10, 20)
    c.data.should be_a(Array(Array(Color)))
  end
  it "creates an array of arrays with default value Color(0,0,0)" do
    c = TestCanvas.new(10, 20)
    c.data[1][1].should eq(Color.new(0, 0, 0))
  end
  it "should be able to access data elements using [] notation" do
    c = Canvas.new(10, 20)
    c[1, 1].should eq(Color.new(0, 0, 0))
  end
  it "should raise an exception if you try to access an element out of bounds" do
    c = Canvas.new(10, 20)
    expect_raises(Exception) do
      c[100, 100]
    end
  end
  it "can set a value using []=" do
    c = Canvas.new(10, 20)
    c[1, 1] = Color.new(1, 1, 1)
    c[1, 1].should eq(Color.new(1, 1, 1))
  end
  it "each_row should return an Iterator" do
    c = Canvas.new(1, 20)
    c.each_row.to_a.size.should eq(20)
    c.each_row.should be_a(Iterator(Array(Color)))
  end
  it "each_row w/ a block should iterate through the rows" do
    c = Canvas.new(1, 20)
    c.each_row { |row| row.should be_a(Array(Color)) }
  end
end
