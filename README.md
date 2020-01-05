# Mu::Result

[![Gem Version](https://badge.fury.io/rb/mu-result.svg)](https://badge.fury.io/rb/mu-result)

This is a really tiny implementation of the Result object.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mu-result'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mu-result

## Usage

```ruby
include 'mu'

result = Result.success
result.success? # => true
result = Result.error
result.error? # => true
result = Result.error.code!(:net_timeout)
result.code # => :net_timeout
result = Result.success(name: 'Arthur Dent', answer: 42)
result.data # => { name: 'Arthur Dent', answer: 42 }
```

### Unwrap

When you want to access to a specific field of the result, you can _unwrap_ it:

```ruby
result = Result.success(user: 'olistik', role: :developer)
result.unwrap(:user) # => 'olistik'
result.unwrap(:role) # => :developer
result.unwrap(:name) # => raises `StandardError (The symbol 'name' is not included in the result data object.)`
```

This is a way to avoid getting unwanted nil values out of the result when passing the wrong field:

```ruby
result = Result.success(user: 'olistik', role: :developer)
value = result.data[:users] # => nil, this could lead to an annoying bug later on because we're not aware there's a typo in `:users`, yet.
value = result.unwrap(:users) # This raises an exception instead, making it evident that we're using the wrong name for the field.
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome at https://source.olisti.co/olistik/mu-result. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Mu::Result project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://source.olisti.co/olistik/mu-result/blob/master/CODE_OF_CONDUCT.md).
