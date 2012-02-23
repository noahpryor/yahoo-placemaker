require 'yahoo-placemaker/scope'
require 'yahoo-placemaker/centroid'

class Yahoo::Placemaker::GeographicScope < Yahoo::Placemaker::Scope
  attr_accessor :woeId, :type, :name, :centroid
  def initialize (json)
    @woeId = json['woeId']
    @type = json['type']
    @name = json['name']
    @centroid = Yahoo::Placemaker::Centroid.new(json['centroid'])
  end
end