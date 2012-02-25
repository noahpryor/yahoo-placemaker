require "yahoo-placemaker/response"
require "yahoo-placemaker/version"

require "json"
require "net/http"

module Yahoo
  module Placemaker

    # Main method for interacting w/ the Yahoo! Placemaker API

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

      Yahoo::Placemaker::Response.new(json)

    end

    private

    # Takes a hash and turns it into a query string that can be used
    # in a URL request

    def self.to_url_params(params)
      params.collect{|key, value| "#{key}=#{value}"}.join('&')
    end

  end
end
