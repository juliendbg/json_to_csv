# frozen_string_literal: true

require_relative 'lib/json_to_csv/version'

Gem::Specification.new do |spec|
  spec.name = 'json_to_csv'
  spec.version = JsonToCsv::VERSION
  spec.authors = ['juliendbg']
  spec.email = ['contact@juliendbg.eu']

  spec.summary = 'A JSON array to CSV converter.'
  spec.description = <<~DESC
    A small Ruby lib aiming to convert JSON files composed of arrays of objects (all following the same schema)
    to a CSV file where one line equals one object'
  DESC
  spec.homepage = 'https://github.com/juliendbg/json_to_csv'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/juliendbg/json_to_csv'
  spec.metadata['changelog_uri'] = 'https://github.com/juliendbg/json_to_csv'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
