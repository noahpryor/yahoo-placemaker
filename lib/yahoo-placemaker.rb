require "yahoo-placemaker/version"
require "json"
require "ostruct"
require "net/http"

module Yahoo
  module Placemaker

    def self.extract (text = '', options = {})

      host = 'wherein.yahooapis.com'

      # These options need to be explicitly set!
      options['documentContent'] = text
      options['appid'] = Yahoo::Placemaker::APP_ID
      options['outputType'] = 'json'
      options['documentType'] = 'text/plain'

      req = ::Net::HTTP::Post.new('/v1/document')
      req.body = to_url_params(options)
      response = ::Net::HTTP.new(host).start do |http|
        http.request(req)
      end
      json = ::JSON.parse(response.body)
      OpenStruct.new(json)
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
