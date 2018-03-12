require 'aws-sdk-s3'
require 'geminabox'
require 'pathname'

Dir["#{File.dirname(__FILE__)}/**/*.rb"].sort!.each { |f| require_relative f }

module GeminaboxSync; end
