Gem::Specification.new do |s|
  s.name        = 'blocksdk'
  s.summary     = 'BlockSDK Ruby SDK'
  s.version     = '0.1.0'
  s.licenses    = ['MIT']
  s.description = 'Ruby library to help you build your crypto application on BlockSDK'
  s.summary     = 'Ruby library to help you build your crypto application on BlockSDK'
  s.authors     = ["BlockSDK"]
  s.email       = 'contact@blocksdk.com'
  s.files       = Dir['lib/**/*']
  s.require_paths = ["lib"]
  s.homepage    = 'http://www.blocksdk.com'

  s.add_development_dependency 'httparty'
end
