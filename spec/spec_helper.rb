require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'fakeweb'
require 'yahoo-placemaker'

Yahoo::Placemaker::APP_ID = 'xxx'

#VCR.config do |c|
#  c.cassette_library_dir = 'spec/fixtures'
#  c.stub_with :fakeweb
#end

RSpec.configure do |config|
end