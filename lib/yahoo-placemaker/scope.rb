require 'yahoo-placemaker/lat_lng'

module Yahoo
  module Placemaker
    class Scope

      attr_accessor :woe_id, :type, :name, :centroid

      def initialize(json)
        @centroid = Yahoo::Placemaker::LatLng.new(json['centroid'])
        @woe_id = json['woeId']
        @type = json['type']
        @name = json['name']
      end

    end
  end
end