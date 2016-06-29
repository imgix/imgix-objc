![imgix logo](https://assets.imgix.net/imgix-logo-web-2014.pdf?page=2&fm=png&w=200&h=200)

# imgix-objc [![Build Status](https://travis-ci.org/imgix/imgix-objc.svg?branch=master)](https://travis-ci.org/imgix/imgix-objc) [![Coverage Status](https://coveralls.io/repos/soffes/imgix-objc/badge.svg?branch=master)](https://coveralls.io/r/soffes/imgix-objc?branch=master) [![Slack Status](http://slack.imgix.com/badge.svg)](http://slack.imgix.com)

Official [imgix](http://imgix.com) client for iOS and macOS.

Written in Objective-C for maximum flexiblity. It's annotated with [nullability](https://developer.apple.com/swift/blog/?id=25) so it works well with Swift.


## Usage

All of the options are implemented as properties with inline documentation so it's easy to manipulate your images without looking up their documentation. Simply create an `IGXClient` with your host and token. (You can specify `nil` for  your token if you don't want signed URLs.)

Once you have a client, you can call `URLWithPath:` to generate an imgix URL for a given path. To generate URLs with parameters, just call `URLWithPath:andOptions:` with an NSDictionary of options instead.

The following example is in Swift, but you can of course use this library in Objective-C as well.

``` swift
import Imgix

// Create a client
let client = IGXClient(host: "nothingmagical.imgix.net", token: "sMTidnYXXg9NB4qh")

// Generate a signed URL
client.URLWithPath("sam.jpg")
// => https://nothingmagical.imgix.net/sam.jpg?s=...

// Generate another signed URL, with adjusted brightness
client.URLWithPath("sam.jpg", options: ["bri": 10])
// => https://nothingmagical.imgix.net/sam.jpg?bri=10&s=...
```
