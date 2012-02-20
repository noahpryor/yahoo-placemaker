require "yahoo-placemaker/version"
require 'json'
require 'ostruct'

module Yahoo
  module Placemaker

    def self.extract (text = '')
      host = 'wherein.yahooapis.com'
      payload = {
        'documentContent' => text,
        'appid' => APP_ID,
        'outputType' => 'json',
        'documentType' => 'text/plain'
      }

      req = Net::HTTP::Post.new('/v1/document')
      req.body = to_url_params(payload)
      response = Net::HTTP.new(host).start {|http| http.request(req) }
      json = JSON.parse(response.body)
      return OpenStruct.new(json)
      end

      private

      def self.to_url_params(h)
      elements = []
      h.keys.size.times do |i|
      elements << "#{h.keys[i]}=#{h.values[i]}"
      end
      elements.join('&')
    end

  end
end
