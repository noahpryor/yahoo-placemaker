require 'yahoo-placemaker/document'

class Yahoo::Placemaker::Response
  attr_accessor :document, :version, :processing_time
  def initialize (json)
    @document = Yahoo::Placemaker::Document.new(json['document'])
    @version = json['version']
    @processing_time = json['processingTime']
  end
end