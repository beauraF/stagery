# Rails Stage

Know at what development life cycle stage you are 👀

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'stagery'
```

And run:

```sh
bundle install
```

## How It Works

1. Use `STAGERY_STAGE` environment variable to define at which stage of your flow you are

2. Use `Stagery.stage` method in your code:

```ruby
Stagery.stage # => "staging"
Stagery.stage.staging? # => true
Stagery.stage.ci? # => false
```

If `STAGERY_STAGE` environment variable is not set, `Stagery.stage` will automatically fallback to `development`.

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- Report [bugs](https://github.com/beauraF/stagery/issues)
- Fix bugs and submit [pull requests](https://github.com/beauraF/stagery/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features
