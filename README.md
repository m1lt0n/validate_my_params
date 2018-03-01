# ValidateMyParams

ValidateMyParams is a tiny ruby library that can be used in any project that
needs parameters validation for methods. It is heavily inspired by [this Airbnb
blog post](https://medium.com/airbnb-engineering/large-scale-payments-systems-and-ruby-on-rails-bfe5b89f6f4). As the blog post puts it, it's better to validate and fail fast, than let bugs crawl into production.

The library consists of a single module that can be included in your classes, allowing you to validate the parameters passed (as a hash / keyword params) to any method.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'validate_my_params'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validate_my_params

## Usage

Let's say that you have a ```Person``` class and want to validate the params passed to a method of this class. All you have to do is include the ValidateMyParams module, which gives you access to 2 methods: ```validate_args``` and ```validate```. Let's see an example:

```ruby
class Person
  include ValidateMyParams
  
  def initialize(params)
    validate_args(params) do
      validate :name, type: String, required: true
      validate :age, type: Integer, required: false
    end
  end
end
```

That's it! If the parameters validation rules don't pass, the method will raise a relevant exception ```ValidateMyParams::MissingParam``` or ```ValidateMyParams::InvalidParam```, so you can catch bugs with invalid params passed to your methods before they appear in production.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/validate_my_params. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ValidateMyParams project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/validate_my_params/blob/master/CODE_OF_CONDUCT.md).
