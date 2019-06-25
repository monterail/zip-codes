module ZipCodes
  VERSION = '0.2.1'

  class << self
    def identify(code)
      db[code]
    end

    def db
      @db ||= begin
        this_file = File.expand_path(File.dirname(__FILE__))
        us_data = File.join(this_file, 'data', 'US.marshal')
        Marshal.load(File.open(us_data))
      end
    end

    def load
      db
    end
  end
end
