require "yahoo/placemaker/response"
require "yahoo/placemaker/exception"
require "yahoo/placemaker/version"

require "json"
require "net/http"

module Yahoo
  module Placemaker

    # Main method for interacting w/ the Yahoo! Placemaker API

    def self.extract (text = '', options = {})

      # TODO: make sure only valid options are passed in..

      unless defined?(Yahoo::Placemaker::APP_ID)
        raise Yahoo::Placemaker::Exception.new("Invalid APP_ID")
      end

      result = nil
      host = 'wherein.yahooapis.com'

      # These options need to be explicitly set!
      options['documentContent'] = text
      options['appid'] = Yahoo::Placemaker::APP_ID
      options['outputType'] = 'json'
      options['documentType'] = 'text/plain'

      req = ::Net::HTTP::Post.new('/v1/document')
      req.body = to_url_params(options)
      begin
        response = ::Net::HTTP.new(host).start do |http|
          http.request(req)
        end
        if defined?(Yahoo::Placemaker::DEBUG) && Yahoo::Placemaker::DEBUG
          puts response.body
        end
        json = ::JSON.parse(response.body)

        result = Yahoo::Placemaker::Response.new(json)
      rescue Exception => e
       # puts e
        # Something has gone horribly wrong...
      end

      result

    end

    private

    # Takes a hash and turns it into a query string that can be used
    # in a URL request

    def self.to_url_params(params)
      params.collect{|key, value| "#{key}=#{value}"}.join('&')
    end

  end
end
