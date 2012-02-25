require 'yahoo-placemaker/place'
class Yahoo::Placemaker::PlaceDetails

  attr_accessor :place_id, :place, :match_type, :place_reference_ids, :weight, :confidence

  def initialize(json)
    @place_id = json['placeId']
    @place = Yahoo::Placemaker::Place.new json['place']
    @match_type = json['matchType']
    @place_reference_ids = json['placeReferenceIds']
    @weight = json['weight']
    @confidence = json['confidence']
  end
end