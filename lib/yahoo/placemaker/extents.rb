require 'yahoo/placemaker/lat_lng'

module Yahoo
  module Placemaker
    class Extents

      attr_accessor :center, :south_west, :north_east

      def initialize(json)
        @center = Yahoo::Placemaker::LatLng.new(json['center'])
        @south_west = Yahoo::Placemaker::LatLng.new(json['southWest'])
        @north_east = Yahoo::Placemaker::LatLng.new(json['northEast'])
      end

    end
  end
end