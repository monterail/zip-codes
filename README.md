# ZipCodes [![Gem Version](https://badge.fury.io/rb/zip-codes.png)](http://badge.fury.io/rb/zip-codes)

Simple gem to get city, state, and time zone for a given zip code. It has a yaml database bundled with it, so you need several mb of memory for the whole hash.

The gem currently supports only US zip codes. The data origin is https://download.geonames.org/export/zip/

The main maintainer is https://github.com/brodyhoskins

## Installation

Add this line to your application's Gemfile:

    gem 'zip-codes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zip-codes

## Usage

```ruby
ZipCodes.identify('30301')
# => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta", :time_zone=>"America/New_York"}
# First run will take a while, as the yaml has to be loaded
```

If you are using Rails, you can load the hash on app startup for production and staging.
```ruby
# config/initializers/load_zip_codes.rb
ZipCodes.load unless Rails.env.development?
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
