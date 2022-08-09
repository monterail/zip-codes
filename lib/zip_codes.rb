# frozen_string_literal: true

require 'active_support/all'
require 'fastcsv'

module ZipCodes
  DB_DIR = File.join(__dir__, 'data')

  @cache = {}

  # Look up city, state, time zone from ZIP code.
  #
  # @param [String|Symbol] country Country ISO code.
  # @param [String] zip_code ZIP code.
  def self.lookup(country, zip_code)
    country = country.to_s.humanize.upcase
    zip_code = zip_code.to_s.upcase

    val = @cache.dig(country, zip_code)
    return parse_entry(val) if val

    @cache[country] ||= {}
    @cache[country][zip_code] ||= {}

    db = File.join(DB_DIR, "#{country}.csv")

    raise ArgumentError, "No database for #{country}" unless File.exist?(db)

    File.open(db) do |f|
      FastCSV.raw_parse(f) do |entry|
        next unless entry[0]&.upcase == zip_code

        @cache[country][zip_code] = entry

        return parse_entry(entry)
      end
    end

    @cache[country][country][zip_code] = nil
  end

  def self.parse_entry(entry)
    {
      city: entry[3],
      state_code: entry[1],
      state_name: entry[2],
      time_zone: ActiveSupport::TimeZone.new(entry[4])
    }
  end
end
