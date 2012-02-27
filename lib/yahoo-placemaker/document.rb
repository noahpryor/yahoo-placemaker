require 'yahoo-placemaker/geographic_scope'
require 'yahoo-placemaker/local_scope'
require 'yahoo-placemaker/administrative_scope'
require 'yahoo-placemaker/reference'
require 'yahoo-placemaker/extents'
require 'yahoo-placemaker/place'

module Yahoo
  module Placemaker
    class Document
  attr_accessor :administrative_scope, :geographic_scope, :local_scopes, :references, :extents, :places
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

    @places = Array.new

    # if the placeDetails key exists then that means that we
    # only have one result so we'll just use it. Otherwise
    # yahoo has given us back some POORLY formatted data which
    # is in numeric keys so we'll search for them and pull them out

    if json['placeDetails']
        @places << Yahoo::Placemaker::Place.new(json['placeDetails'])
    end

    if json.class == Hash
      multiple_place_details = (json.map{ |k,v| k =~ /^[\d]+$/ ? v : nil }).compact
      if multiple_place_details.any?
        multiple_place_details.each do |place|
            @places << Yahoo::Placemaker::Place.new(place['placeDetails'])
        end
      end
    end

    @local_scopes = Array.new
    if json['localScopes']
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

    # referenceList -> references

    @references = Array.new
    if json['referenceList']
      if json['referenceList'].class == Array
        json['referenceList'].each do |reference|
          @references << Yahoo::Placemaker::Reference.new(reference)
        end
      else
        @references << Yahoo::Placemaker::Reference.new(json['referenceList']['reference'])
      end
    end

  end
    end
  end
end