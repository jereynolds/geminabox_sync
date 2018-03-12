require 'pry-byebug'
class Geminabox::Stores::AwsS3Store

  class << self
    attr_accessor :bucket_name, :key_prefix
  end

  def self.sync_from_remote
    s3_bucket.objects(prefix: key_prefix).each do |object|
      local_path = path(object.key)
      local_path.dirname.mkpath()

      object.download_file(path(object.key))
    end
  end

  def self.sync_to_remote
    upload_item(root_data_path)
  end

  private

  # Recursively walk the directory tree at `path`
  # Upload the item to s3 if it is a normal file
  def self.upload_item(path)
    if path.directory?
      path.each_child do |child|
        upload_item(child)
      end
    else
      s3_bucket.put_object({
        body: path.read,
        key: key(path)
      })
    end
  end

  # Generate an s3 key from a file path
  def self.key(pathname)
    suffix = pathname.relative_path_from(root_data_path).to_s

    "#{key_prefix}/#{suffix}"
  end

  # Generate a file path from an s3 key
  def self.path(s3_key)
    s3_prefix_path = Pathname(key_prefix)
    s3_key_path = Pathname(s3_key)

    root_data_path + s3_key_path.relative_path_from(s3_prefix_path)
  end

  def self.root_data_path
    Pathname(Geminabox.data)
  end

  def self.s3_client
    @s3_client ||= Aws::S3::Client.new
  end

  def self.s3_bucket
    @s3_bucket ||= Aws::S3::Bucket.new(bucket_name, client: s3_client)
  end

end
