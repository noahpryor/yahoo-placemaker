require 'spec_helper'

describe Yahoo::Placemaker::LatLng do

  it "returns the latitude" do
    stub = { :latitude => 0.0, :longitude => 0.0 }
    ll = Yahoo::Placemaker::LatLng.new stub
    ll.latitude.should == 0.0
  end

  it "returns the longitude" do
    stub = { :latitude => 0.0, :longitude => 0.0 }
    ll = Yahoo::Placemaker::LatLng.new stub
    ll.longitude.should == 0.0
  end
end