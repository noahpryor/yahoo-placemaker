class Yahoo::Placemaker::Reference
  attr_accessor :woe_ids, :end, :start, :place_reference_id, :place_ids, :text, :type, :xpath, :is_plaintext_marker

  def initialize(json)

    @woe_ids = json['woeIds']
    @end = json['end']
    @start = json['start']
    @place_reference_id = json['placeReferenceId']
    @place_ids = json['placeIds']
    @text = json['text']
    @type = json['type']
    @xpath = json['xpath']
    @is_plaintext_marker = json['isPlaintextMarker']
  end

end