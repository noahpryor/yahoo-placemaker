# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "yahoo/placemaker/version"

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = "yahoo-placemaker"
  s.version     = Yahoo::Placemaker::VERSION
  s.authors     = ["Kyle Decot"]
  s.email       = ["kyle.decot@me.com"]
  s.homepage    = "http://github.com/kyledecot/yahoo-placemaker"
  s.summary     = "Easily interact w/ the Yahoo Placemaker API"
  s.description = "Easily interact w/ the Yahoo Placemaker API"

  s.rubyforge_project = "yahoo-placemaker"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "json"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "fakeweb"
  s.add_development_dependency "vcr"

end