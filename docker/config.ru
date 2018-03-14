require 'rubygems'
require 'geminabox_sync'

GeminaboxSync::AwsS3Store.bucket_name = ENV['GEMINABOX_S3_BUCKET_NAME']
GeminaboxSync::AwsS3Store.key_prefix = ENV['GEMINABOX_S3_KEY_PREFIX']

Geminabox.store = GeminaboxSync::AwsS3Store

# Initial sync of the files prior to starting the server
GeminaboxSync::AwsS3Store.sync_from_remote

run Geminabox::Server
