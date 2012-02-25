require 'yahoo-placemaker/geographic_scope'
require 'yahoo-placemaker/local_scope'
require 'yahoo-placemaker/administrative_scope'
require 'yahoo-placemaker/reference_list'
require 'yahoo-placemaker/reference'
require 'yahoo-placemaker/extents'
require 'yahoo-placemaker/place'
require 'yahoo-placemaker/places'

class Yahoo::Placemaker::Document
  attr_accessor :administrative_scope, :geographic_scope, :local_scopes, :reference_list, :extents, :place_details, :places
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

    @places = Yahoo::Placemaker::Places.new
    # if the placeDetails key exists then that means that we
    # only have one result so we'll just use it. Otherwise
    # yahoo has given us back some POORLY formatted data which
    # is in numeric keys so we'll search for them and pull them out

    if json.has_key? 'placeDetails'
        @places << Yahoo::Placemaker::Place.new(json['placeDetails'])
    else
      (json.map{ |k,v| k =~ /^[\d]+$/ ? v : nil }).compact.each do |place|
        @places << Yahoo::Placemaker::Place.new(place['placeDetails'])
      end
    end

    if json['localScopes']
      @local_scopes = Array.new
      if json['localScopes'].class == Array
        json['localScopes'].each do |ls|
          @local_scopes << Yahoo::Placemaker::LocalScope.new(ls['localScope'])
        end
      else
          @local_scopes << Yahoo::Placemaker::LocalScope.new(json['localScopes']['localScope'])
      end
    end

    if json['extents']
      @extents = Yahoo::Placemaker::Extents.new(json['extents'])
    end

    @reference_list = Yahoo::Placemaker::ReferenceList.new
    if json['referenceList']
      json['referenceList'].each do |reference|
        @reference_list << Yahoo::Placemaker::Reference.new(reference)
      end
    end

  end
end