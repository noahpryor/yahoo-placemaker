class Yahoo::Placemaker::Centroid
  attr_accessor :latitude, :longitude
  def initialize(json)
    @latitude = json['latitude'].to_f
    @longitude = json['longitude'].to_f
  end
end