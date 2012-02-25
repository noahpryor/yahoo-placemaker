require 'yahoo-placemaker/geographic_scope'
require 'yahoo-placemaker/local_scope'
require 'yahoo-placemaker/administrative_scope'
require 'yahoo-placemaker/reference_list'
require 'yahoo-placemaker/extents'
require 'yahoo-placemaker/place_details'

class Yahoo::Placemaker::Document
  attr_accessor :administrative_scope, :geographic_scope, :local_scopes, :reference_list, :extents, :place_details
  def initialize(json)

    if json['administrativeScope']
      @administrative_scope = json['administrativeScope']
    end

    if json['geographicScope']
      @geographic_scope = Yahoo::Placemaker::GeographicScope.new(json['geographicScope'])
    end

    if json['administrativeScope']
      @administrative_scope = Yahoo::Placemaker::AdministrativeScope.new(json['administrativeScope'])
    end

    if json['localScopes']
      @localScopes = Array.new
      json['localScopes'].each do |ls|
        @localScopes << Yahoo::Placemaker::LocalScope.new(ls)
      end
    end
    if json['placeDetails']
      @place_details = Yahoo::Placemaker::PlaceDetails.new json['placeDetails']
    end

    if json['extents']
      @extents = Yahoo::Placemaker::Extents.new(json['extents'])
    end

    if json['referenceList']
      @reference_list = Yahoo::Placemaker::ReferenceList.new json['referenceList']
    end

  end
end