# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'iuliia/version'

Gem::Specification.new do |spec|
  spec.name = 'iuliia'
  spec.version = Iuliia::VERSION
  spec.authors = ['Andrey Nikiforov']
  spec.email = ['a.d.nikiforov@gmail.com']

  spec.summary = <<~SUMMARY
    Russian transliteration using nalgeon/iuliia schemas
    Gem has been renamed to 'iuliia'. This is the last version of 'iuliia-rb'. 
    Please, use 'iuliia' instead.
  SUMMARY
  spec.homepage = 'https://github.com/adnikiforov/iuliia-rb'
  spec.license = 'MIT'
  spec.post_install_message = <<~MESSAGE
    ! The 'iuliia-rb' gem has been renamed to 'iuliia'. 
    Version 0.2.1 is the last version of 'iuliia-rb'. Please, use 'iuliia' instead.
  MESSAGE

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/adnikiforov/iuliia-rb'
    spec.metadata['changelog_uri'] = 'https://github.com/adnikiforov/iuliia-rb/blob/master/CHANGELOG.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'json'
end
