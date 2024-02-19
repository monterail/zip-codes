# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'yaml'

task :convert do
  codes = {}
  File.open('lib/data/US.txt').each_line do |line|
    array = line.split("\t")
    codes[array[1]] = {
      state_code: array[4],
      state_name: array[3],
      city: array[2]
    }
  end

  File.write('lib/data/US.yml', codes.to_yaml)
end

task :update do
  path = File.join(__dir__, 'lib', 'data', 'US.yml')
  codes = ::YAML.safe_load_file(path, permitted_classes: [Symbol])

  # Data comes from https://download.geonames.org/export/zip/
  File.open('lib/data/US.txt').each_line do |line|
    array = line.split("\t")

    # Only add codes that are not in the list already and that parse out a state code
    if codes[array[1]].nil? && array[4] != ''
      codes[array[1]] = {
        state_code: array[4],
        state_name: array[3],
        city: array[2]
      }
    end
  end

  File.write('lib/data/US.yml', codes.to_yaml)
end
