# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'yaml'

task :convert do
  codes = {}
  File.open('lib/data/US.txt').each_line do |line|
    array = line.split('\t')
    codes[array[1]] = {
      state_code: array[4],
      state_name: array[3],
      city: array[2]
    }
  end

  File.open('lib/data/US.yml', 'w') do |file|
    file.write codes.to_yaml
  end
end
