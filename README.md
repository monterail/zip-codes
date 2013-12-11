# ZipCodes

Simple gem to get city and state for given zip code. It has yaml database bundled with it, so you need several mb of memory for whole hash.

## Installation

Add this line to your application's Gemfile:

    gem 'zip-codes'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zip-codes

## Usage

```ruby
Zip.identify('30301')
# => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta"}
# First run will take while, as yaml has to be loaded
```

If you are using Rails, you can load hash on app startup for production and staging.
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
