## Information

This gems for WebMoney Events API.
https://events-api.webmoney.ru

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'webmoney-events', git: 'https://github.com/umount/webmoney-events.git'
```

And then execute:

```shell
$ bundle
```

## Usage

Create events instanse, use you API secret access token

```ruby
events = WebmoneyEvents.new(access_token: 'xxxxxxxxxxxx')

# Get feed
feed = events.feed.get

# Universal requests without parse
response = events.api_request(get: 'Feed/New').request

# Universal requests parse JSON
response = events.api_request(get: 'Feed/New').response

```
