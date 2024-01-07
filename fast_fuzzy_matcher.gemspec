# frozen_string_literal: true

require_relative "lib/fuzzy_matcher/version"

Gem::Specification.new do |spec|
  spec.name = "fast_fuzzy_matcher"
  spec.version = FuzzyMatcher::VERSION
  spec.authors = ["Vlad Dyachenko"]
  spec.email = ["vla-dy@yandex.ru"]

  spec.summary = "fast_fuzzy_matcher is the fastest fuzzy search library for Ruby."
  spec.description = "A tiny and blazing-fast fuzzy search in pure Ruby with FFI bindings to Go."\
                     "Fuzzy searching allows for flexibly matching a string with partial input, " \
                     "useful for filtering data very quickly based on lightweight user input."
  spec.homepage = "https://github.com/wowinter13/fast_fuzzy_matcher"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata    = {
    'bug_tracker_uri'   => 'https://github.com/wowinter13/fast_fuzzy_matcher/issues',
    'changelog_uri'     => "https://github.com/wowinter13/fast_fuzzy_matcher/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/github/wowinter13/fast_fuzzy_matcher",
    'source_code_uri'   => "https://github.com/wowinter13/fast_fuzzy_matcher"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.test_files = Dir['spec/**/*']

  spec.add_dependency "ffi"
end
