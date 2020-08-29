# TalkApi

[![Gem Version](https://badge.fury.io/rb/talk_api.svg)](https://badge.fury.io/rb/talk_api)

Client library for (talk API)[http://a3rt.recruit-tech.co.jp/product/talkAPI/]

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'talk_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install talk_api

## Usage

First, (Register API KEY for Talk API)[http://a3rt.recruit-tech.co.jp/product/talkAPI/registered/]


```ruby
require 'talk_api'
```

### Run Talk API

```ruby
client = TalkApi::Client.new(api_key: '<API KEY>') # TalkApi::Client instance
response = client.smalltalk('<messages>')          # Send text to API and return a response
response.success?                                  # true or false
response.first_message                             # Return a text message
```

### Example
```ruby
client = TalkApi::Client.new(api_key: 'valid api key')
response = client.smalltalk('あのイーハトーヴォのすきとほった風、夏でも底に冷たさをもつ青いそら')
response.first_message
=> "それはいいですね"
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ryonkn/talk_api.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
