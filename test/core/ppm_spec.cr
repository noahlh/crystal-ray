require "../spec_helper"

describe PPM do
  describe "#write_header" do
    it "writes a header using the PPM format" do
      IO.pipe do |r, w|
        c = Canvas.new(1, 1)
        p = PPM.new(w)
        p.generate(c)
        r.gets.should eq("P3")
        r.gets.should eq("1 1")
        r.gets.should eq("255")
      end
    end
  end
  describe "#write_body" do
    it "writes the body using the PPM format" do
      IO.pipe do |r, w|
        c = Canvas.new(3, 2)
        p = PPM.new(w)
        p.write_body(c)
        r.gets.should eq("  0   0   0   0   0   0   0   0   0 ")
        r.gets.should eq("  0   0   0   0   0   0   0   0   0 ")
      end
    end
  end
end
