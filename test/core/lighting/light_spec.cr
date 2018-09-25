require "../../spec_helper"

describe Pointlight do
  it "has position & intensity" do
    light = Pointlight.new(position: Point.new(0, 0, 0), intensity: Color.new(1, 1, 1))
    light.position.should eq(Point.new(0, 0, 0))
    light.intensity.should eq(Color.new(1, 1, 1))
  end
end
describe Lighting do
  material = Material.new
  position = Point.new(0, 0, 0)
  sqrt2over2 = Math.sqrt(2)/2
  white = Color.new(1, 1, 1)

  it "calculates the color at a given position based on the eye being directly between the light & surface" do
    eye_vector = Vector.new(0, 0, -1)
    normal_vector = Vector.new(0, 0, -1)
    light = Pointlight.new(Point.new(0, 0, -10), white)
    lighting = Lighting.new(material, light, position, eye_vector, normal_vector)
    lighting.color.should eq(Color.new(1.9, 1.9, 1.9))
  end
  it "calculates the color when looking down from a 45deg angle" do
    eye_vector = Vector.new(0, sqrt2over2, sqrt2over2)
    normal_vector = Vector.new(0, 0, -1)
    light = Pointlight.new(Point.new(0, 0, -10), white)
    lighting = Lighting.new(material, light, position, eye_vector, normal_vector)
    lighting.color.should eq(Color.new(1.0, 1.0, 1.0))
  end
  it "calculates the color when the light source is at a 45 degree angle" do
    eye_vector = Vector.new(0, 0, -1)
    normal_vector = Vector.new(0, 0, -1)
    light = Pointlight.new(Point.new(0, 10, -10), white)
    lighting = Lighting.new(material, light, position, eye_vector, normal_vector)
    lighting.color.should be_close(Color.new(0.7364, 0.7364, 0.7364), 0.001)
  end
  it "calculates the color when the eye is in the path of the reflection vector" do
    eye_vector = Vector.new(0, -sqrt2over2, -sqrt2over2)
    normal_vector = Vector.new(0, 0, -1)
    light = Pointlight.new(Point.new(0, 10, -10), white)
    lighting = Lighting.new(material, light, position, eye_vector, normal_vector)
    lighting.color.should be_close(Color.new(1.6364, 1.6364, 1.6364), 0.001)
  end
  it "calculates the color when the light is behind the surface" do
    eye_vector = Vector.new(0, 0, -1)
    normal_vector = Vector.new(0, 0, -1)
    light = Pointlight.new(Point.new(0, 0, 10), white)
    lighting = Lighting.new(material, light, position, eye_vector, normal_vector)
    lighting.color.should eq(Color.new(0.1, 0.1, 0.1))
  end
end
