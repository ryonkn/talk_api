# frozen_string_literal: true

require_relative 'lib/talk_api/version'

Gem::Specification.new do |spec|
  spec.name          = 'talk_api'
  spec.version       = TalkApi::VERSION
  spec.authors       = ['Ryo Nakano']
  spec.email         = ['ryo.z.nakano@gmail.com']

  spec.summary       = 'Client library for talk API'
  spec.description   = 'Client library for talk API'
  spec.homepage      = 'https://github.com/ryonkn/talk_api'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'httpclient', '~> 2.8'
end
