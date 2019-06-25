require 'bundler/gem_tasks'
require 'yaml'
require 'benchmark'

file 'lib/data/US.yml' do
  codes = {}
  File.open('lib/data/US.txt').each_line do |line|
    array = line.split('\t')
    codes[array[1]] = {
      state_code: array[4],
      state_name: array[3],
      city:       array[2]
    }
  end

  File.open('lib/data/US.yml', 'w') do |file|
    file.write codes.to_yaml
  end
end

file 'lib/data/US.marshal' => 'lib/data/US.yml' do
  File.write('lib/data/US.marshal', Marshal.dump(YAML.load(File.read('lib/data/US.yml'))))
end

task :convert => ['lib/data/US.marshal', 'lib/data/US.yml']

task :benchmark => :convert do
  Benchmark.bm(15) do |x|
    x.report("YAML.load") do
      YAML.load(File.read('lib/data/US.yml'))
    end

    x.report("Marshal.load") do
      Marshal.load(File.read('lib/data/US.marshal'))
    end
  end
end
