# FuzzyMatch

This library is a work in progress. 

The fastest Fuzzy Matcher in the wild west. FFI-based.

Find a needle in a haystack based on string similarity and regular expression rules.


### Basic usage

Just pass an array of strings to the matcher and it will return the best match(es) for the given needle.

```ruby
require 'fast_fuzzy_matcher'

FuzzyMatcher.find("whl", ["cartwheel", "foobar", "wheel", "baz"])
=> ["cartwheel", "wheel"]

```

### Advanced usage

Better documentation is coming soon. For now, please refer to the specs.



# Benchmarks

To be done.

Approximately 10-60x faster than the fastest Ruby implementation. The difference is more pronounced for longer strings and larger dictionaries.


## Documentation

Detailed documentation is available at [rubydoc](https://rubydoc.info/gems/fast_fuzzy_matcher).

## Installation

fast_fuzzy_matcher is available as a gem, to install it just install the gem:

    gem install fast_fuzzy_matcher

If you're using Bundler, add the gem to Gemfile.

    gem 'fast_fuzzy_matcher'

Run `bundle install`.

## Running tests

    bundle exec rspec spec/


## Contributing

1. Fork it ( https://github.com/wowinter13/fast_fuzzy_matcher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

MIT License. See LICENSE for details.
