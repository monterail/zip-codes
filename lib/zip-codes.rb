require 'yaml'

module ZipCodes
  VERSION = '0.2.1'

  class << self

    def identify(code, countries = ["US"])
      db(countries)[code]
    end

    def db(countries)
      hash = {}
      countries.each do |country|
        this_file = File.expand_path(File.dirname(__FILE__))
        us_data = File.join(this_file, 'data', "#{country}.yml")
        tmp = YAML.load(File.open(us_data))
        hash.merge!(tmp)
      end

      hash
    end

    def load
      db
    end
  end
end
