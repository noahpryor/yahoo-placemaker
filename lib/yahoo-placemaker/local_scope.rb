require 'yahoo-placemaker/scope'
require 'yahoo-placemaker/ancestor'

class Yahoo::Placemaker::LocalScope < Yahoo::Placemaker::Scope

  attr_accessor :ancestors, :centroid, :south_west, :north_east

  def initialize (json)
    super(json)
    @centroid = Yahoo::Placemaker::LatLng.new json['centroid']
    @south_west = Yahoo::Placemaker::LatLng.new json['southWest']
    @north_east = Yahoo::Placemaker::LatLng.new json['northEast']

    # Yahoo doesn't always return an array of ancestors; ancestors can
    # be an array, a hash, or a string containing "\n"?! We need to
    # account for this and stuff everything into @ancestors...

    @ancestors = Array.new
    if json['ancestors'].class == Array
      json['ancestors'].each do |ancestor|
        @ancestors << Yahoo::Placemaker::Ancestor.new(ancestor['ancestor'])
      end
    elsif json['ancestors'].class == Hash
        @ancestors << Yahoo::Placemaker::Ancestor.new(json['ancestors']['ancestor'])
    else
      # no ancestors...country?
    end
  end
end