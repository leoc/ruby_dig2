# RubyDig2

`Hash#dig2` and `Array#dig2` enhances Rubys `Hash#dig` and `Array#dig` methods functionality.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ruby_dig2'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ruby_dig2

## Usage

```
require 'ruby_dig2'

response = {mom: {first: "Marge", last: "Bouvier"},
            dad: {first: "Homer", last: "Simpson"},
            kids: [
                {first: "Bart", last: "Simpson"},
                {first: "Lisa", last: "Simpson"}
            ]}

response.dig2(:kids, 1, :first)
# => "Lisa"
```

## Contributing

1. Fork it ( https://github.com/leoc/ruby_dig2/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
