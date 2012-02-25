require 'yahoo-placemaker/scope'
require 'yahoo-placemaker/ancestor'
require 'yahoo-placemaker/centroid'

class Yahoo::Placemaker::LocalScope < Yahoo::Placemaker::Scope

  attr_accessor :ancestors, :centroid, :south_west, :north_east

  def initialize (json)
    super(json)
    @centroid = Yahoo::Placemaker::Centroid.new json['centroid']
    @south_west = Yahoo::Placemaker::LatLng.new json['southWest']
    @north_east = Yahoo::Placemaker::LatLng.new json['northEast']
    @ancestors = Array.new
    json['ancestors'].each do |ancestor|
      @ancestors << Yahoo::Placemaker::Ancestor.new(ancestor['ancestor'])
    end
  end
end