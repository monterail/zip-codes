require 'yaml'

module ZipCodes
  VERSION = '0.1.0'

  class << self
    def identify code
      db[code]
    end

    def db
      @db ||= begin
        spec  = Gem::Specification.find_by_name("zip-codes")
        us    = spec.gem_dir + "/lib/data/US.yml"
        YAML.load(File.open(us))
      end
    end

    def load
      db
    end
  end
end
