# Gem in a Box Synced

An extension of Gem in a Box (https://github.com/geminabox/geminabox), sync adds a middleware layer which allows the syncing of the gem repository to a data store other than the local filesystem. Comes included with an AWS S3 Gemstore adapter, but extensions for other storage layers are easily added.

## Usage

`gem install geminabox_sync`

config.ru:
```ruby
require 'rubygems'
require 'geminabox_sync'

GeminaboxSync::AwsS3Store.bucket_name = 'my-bucket-name'
GeminaboxSync::AwsS3Store.key_prefix = 'my-gem-repository-prefix'

Geminabox.store = GeminaboxSync::AwsS3Store

run Geminabox::Server
```


## Usage with docker
The Dockerfile includes an entry script and config.ru file for quick and easy bootstrapping of everything the service needs to sync to AWS S3. The container will need the following environment variables passed in:
```
  AWS_ACCESS_KEY_ID
  AWS_SECRET_ACCESS_KEY
  AWS_REGION
  GEMINABOX_S3_BUCKET_NAME
  GEMINABOX_S3_KEY_PREFIX
```

### Example
`docker build -t geminabox_sync .`

```
docker run -d --restart=always --name geminabox \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    -e AWS_REGION=$AWS_DEFAULT_REGION \
    -e GEMINABOX_S3_BUCKET_NAME=mys3bucket \
    -e GEMINABOX_S3_KEY_PREFIX=mygemrepository \
    -p 9292:9292 geminabox_sync
```
