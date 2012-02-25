require 'yahoo-placemaker/scope'
require 'yahoo-placemaker/centroid'

class Yahoo::Placemaker::AdministrativeScope < Yahoo::Placemaker::Scope
  def initialize (json)
    @woe_id = json['woeId']
    @type = json['type']
    @name = json['name']
    @centroid = Yahoo::Placemaker::Centroid.new(json['centroid'])
  end
end