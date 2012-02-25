![Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker/guide/images/logo.png)

`yahoo-placemaker` is a rubygem that allows for easy interaction w/ the [Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker) API.

## Build Status

![Build Status](https://secure.travis-ci.org/kyledecot/yahoo-placemaker.png)

## Installation

    gem install yahoo-placemaker

## Documentation

http://rdoc.info/github/kyledecot/yahoo-placemaker/master/frames

## Usage

    require 'yahoo-placemaker'
    Yahoo::Placemaker::APP_ID = 'xxxx'
    result = Yahoo::Placemaker.extract "Columbus Ohio is my hometown"
    result.document.geographic_scope.name # Columbus, OH, US
    result.document.administrative_scope.centroid.latitude # 39.962
    result.document.references.first.text # Columbus Ohio
    
## Contributing

I am by not means a Ruby guru so if you have seen something that I have done incorrectly or that could be improved please feel free to contribute some code.