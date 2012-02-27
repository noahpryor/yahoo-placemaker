module Yahoo
  module Placemaker
    class Ancestor
      attr_accessor :woe_id, :type, :name

      def initialize (json)
        @woe_id = json['woeId']
        @type = json['type']
        @name = json['name']
      end
    end
  end
end