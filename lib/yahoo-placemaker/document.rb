require 'yahoo-placemaker/geographic_scope'
require 'yahoo-placemaker/local_scope'

class Yahoo::Placemaker::Document
  attr_accessor :administrative_scope, :geographic_scope, :local_scopes, :reference_list
  def initialize(json)
    @administrative_scope = json['administrativeScope']
    @geographic_scope = Yahoo::Placemaker::GeographicScope.new(json['geographicScope'])
    @localScopes = Array.new
    json['localScopes'].each do |ls|
      @localScopes << Yahoo::Placemaker::LocalScope.new(ls)
    end
    @reference_list = json['referenceList']
  end
end