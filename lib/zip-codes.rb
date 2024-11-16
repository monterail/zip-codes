# frozen_string_literal: true

require 'yaml'

module ZipCodes
  VERSION = '0.3.4'

  class << self
    def identify(code)
      db[code]
    end

    def db
      @db ||= begin
        path = File.join(__dir__, 'data', 'US.yml')
        ::YAML.safe_load_file(path, permitted_classes: [Symbol])
      end
    end

    def load
      db
    end
  end
end
