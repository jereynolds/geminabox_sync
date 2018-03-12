require 'rubygems'
require 'geminabox_sync'

GeminaboxSync::AwsS3Store.bucket_name = ENV['GEMINABOX_S3_BUCKET_NAME']
GeminaboxSync::AwsS3Store.key_prefix = ENV['GEMINABOX_S3_KEY_PREFIX']

Geminabox.store = GeminaboxSync::AwsS3Store

run Geminabox::Server
