require 'aws-sdk-s3'
require 'digest/md5'
require 'geminabox'
require 'pathname'

Dir["#{File.dirname(__FILE__)}/geminabox_sync/**/*.rb"].sort!.each { |f| require_relative f }

module Geminabox
  class << self
    attr_accessor :store
  end

  set_defaults(store: GeminaboxSync::AwsS3Store)

  class Server
    use GeminaboxSync::Middleware
  end
end
