require 'yaml'

module ZipCodes
  VERSION = '0.2.1'

  class << self

    def init_db(arr)
      @db = nil
      @countries = arr
    end

    def load_db
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
      @db
    end

    def identify(code, countries = ["US"])
      init_db(countries) if @countries == nil || (countries.sort != @countries.sort)
      db[code]
    end

    def db
      load_db
    end

    def load
      db
    end
  end
end
