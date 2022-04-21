# ZipCodes

Retrieve city, state, and time zone for a given ZIP code for those times when API's just aren’t doable 🎉

## Installation

Using bundler, add to the `Gemfile`:

```ruby
gem 'zip-codes'
```

Or standalone:

```
$ gem install zip-codes
```

## Standard Usage

```ruby
ZipCodes.lookup('US', '30301')
# => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta", :time_zone=>"America/New_York"}

# Case insensitive
ZipCodes.lookup('uS', '30301')
# => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta", :time_zone=>"America/New_York"}

# Symbols work too
ZipCodes.lookup(:US, '30301')
# => {:state_code=>"GA", :state_name=>"Georgia", :city=>"Atlanta", :time_zone=>"America/New_York"}
```
