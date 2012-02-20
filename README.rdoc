![Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker/guide/images/logo.png)

`yahoo-placemaker` is a rubygem that allows for easy interaction w/ the [Yahoo Placemaker](http://developer.yahoo.com/geo/placemaker) API.


**Examples**

    require 'yahoo-placemaker'
    Yahoo::Placemaker.APP_ID = 'xxxx'
    place = Yahoo::Placemaker.extact "Columbus Ohio is my hometown"