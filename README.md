# Zelkova

This is a pure Ruby implementation of a BK-Tree (https://signal-to-noise.xyz/post/bk-tree/) which
can be used for any sort of quick comparison for hamming distances. Usually this is for something
like spell check or auto suggestions, but it can also be utilized for image similarity search as
well.

It runs completely in memory, which makes it very quick (even at 500,000 words), this takes up a
little space, taking about 4MB for 400,000 words. Building the graph taking about 35 seconds for 400k
elements and about 1-2 seconds to search depending on the length of the search query (longer query
is longer time).

Eventually it'd be faster to rewrite this in C and toss a Ruby wrapper over it, but for now this will
work quite well for what we want it to.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'zelkova'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install zelkova

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/zelkova. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/zelkova/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Zelkova project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/zelkova/blob/master/CODE_OF_CONDUCT.md).
