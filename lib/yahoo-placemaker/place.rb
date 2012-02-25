require 'yahoo-placemaker/centroid'

class Yahoo::Placemaker::Place

  attr_accessor :place_id, :match_type, :place_reference_ids, :weight, :confidence
  attr_accessor :centroid, :type, :woe_id, :name

  def initialize(json)

    @place_id = json['placeId']
    @centroid = Yahoo::Placemaker::Centroid.new json['place']['centroid']
    @type = json['place']['type']
    @woe_id = json['place']['woeId']
    @name = json['place']['name']

    @match_type = json['matchType']
    @place_reference_ids = json['placeReferenceIds']
    @weight = json['weight'].to_i
    @confidence = json['confidence'].to_i
  end
end