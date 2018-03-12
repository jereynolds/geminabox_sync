require 'aws-sdk-s3'
require 'geminabox'
require 'pathname'

Dir["#{File.dirname(__FILE__)}/**/*.rb"].sort!.each { |f| require_relative f }

module GeminaboxSync; end

module Geminabox
  class << self
    attr_accessor :store
  end

  set_defaults(store: Stores::AwsS3Store)

  class Server
    use GeminaboxSync::Middleware
  end
end
