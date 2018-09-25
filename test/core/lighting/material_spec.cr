require "../../spec_helper"

describe Material do
  it "has the default properties of a material" do
    m = Material.new
    m.color.should eq(Color.new(1, 1, 1))
    m.ambient.should eq(0.1)
    m.diffuse.should eq(0.9)
    m.specular.should eq(0.9)
    m.shininess.should eq(200)
  end
end
