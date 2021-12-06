#!/usr/bin/env ruby

Dir[File.join(__dir__, 'lib', '*.rb')].each { |file| require file }

if ARGV.size == 1
  parser = ParserJob.new
  parser.run(source: ARGV[0])
else
  puts "Wrong number of arguments"
end