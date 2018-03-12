class Geminabox::Stores::AwsS3Store

  class << self
    attr_accessor :bucket_name, :key_prefix
  end

  def self.sync_to_remote
  end

  def self.sync_from_remote
  end

end
