![Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker/guide/images/logo.png)

`yahoo-placemaker` is a rubygem that allows for easy interaction w/ the [Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker) API.

## Installation

    gem install yahoo-placemaker

## Usage

    require 'yahoo-placemaker'
    Yahoo::Placemaker::APP_ID = 'xxxx'
    place = Yahoo::Placemaker.extact "Columbus Ohio is my hometown"
    
## Contributing

I am by not means a Ruby guru so if you have seen something that I have done incorrectly or that could be improved please feel free to contribute some code.