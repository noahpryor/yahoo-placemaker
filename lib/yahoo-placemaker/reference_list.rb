require 'yahoo-placemaker/reference'
class Yahoo::Placemaker::ReferenceList < Array
  def initialize(json)
    json.each do |reference|
      self << Yahoo::Placemaker::Reference.new(reference)
    end
  end
end