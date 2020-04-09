# frozen_string_literal: true

require_relative 'lib/sorting/version'

Gem::Specification.new do |spec|
  spec.name          = 'sorting'
  spec.version       = Sorting::VERSION
  spec.authors       = ['exaesel']
  spec.email         = ['exaesel@gmail.com']

  spec.summary       = 'empty'
  spec.description   = 'empty'
  spec.homepage      = 'https://empty.com'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'empty'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://empty.com'
  spec.metadata['changelog_uri'] = 'https://empty.com'

  spec.files = Dir.glob('**/*').select { |e| File.file? e }.reject { |f| f.match /^(pkg|bin|test|spec|features)/ }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'thor'
  spec.add_dependency 'zeitwerk'
end
