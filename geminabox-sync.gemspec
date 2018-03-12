Gem::Specification.new do |s|
  s.name = 'geminabox-sync'
  s.version = '0.0.0'
  s.summary = 'Back geminabox with a syncable remote data store'
  s.authors = ['Jacob Reynolds']
  s.email = 'jacob.e.reynolds@gmail.com'
  s.files = Dir['lib/**/*']
  s.license = 'MIT-LICENSE'
  s.require_paths = ['lib']

  s.add_dependency('aws-sdk-s3')
  s.add_dependency('geminabox')
  s.add_dependency('json')

  s.add_development_dependency('pry-byebug')
end
