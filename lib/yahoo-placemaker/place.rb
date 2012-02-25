require 'yahoo-placemaker/centroid'
class Yahoo::Placemaker::Place

  attr_accessor :centroid, :type, :woe_id, :name

  def initialize(json)
    @centroid = Yahoo::Placemaker::Centroid.new json['centroid']
    @type = json['type']
    @woe_id = json['woeId']
    @name = json['name']
  end

end