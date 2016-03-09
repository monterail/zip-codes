require 'yaml'

module ZipCodes
  VERSION = '0.2.2'

  class << self

    def reinit_db(arr)
      @db = nil
      @countries = arr
    end

    def identify(code, countries = ["US"])
      reinit_db(countries) if @countries == nil || (countries.sort != @countries.sort)
      db[code]
    end

    def db
      @db ||= begin
        hash = {}
        @countries.each do |country|
          this_file = File.expand_path(File.dirname(__FILE__))
          us_data = File.join(this_file, 'data', "#{country}.yml")
          tmp = YAML.load(File.open(us_data))
          hash.merge!(tmp)
        end
        hash
      end
    end

    def load
      db
    end
  end
end
