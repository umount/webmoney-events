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

```

# Feed requests

```ruby
# get feed
feed = events.feed.get
```

# Group requests

```ruby
# https://events-api.webmoney.ru/Help/Api/POST-Group-CreateRegular
# create new public group
# visibility: public | private | secret | wmpublic

response = events.group.create(
  name: 'Test public group',
  desc: 'Description',
  visibility: 'public'
)

# get group info
# https://events-api.webmoney.ru/Help/Api/GET-Group-Info_groupUid

response = events.group.info('31c64237-232d-489f-800c-5f75c98e31ac')

# hide group
# https://events-api.webmoney.ru/Help/Api/POST-Group-Hide

events.group.hide('31c64237-232d-489f-800c-5f75c98e31ac')

# leave group
# https://events-api.webmoney.ru/Help/Api/POST-Group-Leave

events.group.leave('dc5d554c-2b3d-48fe-8a7d-a76c7deceb7e')

# create business group
# https://events-api.webmoney.ru/Help/Api/POST-Group-CreateBusiness

response = events.group.create_business(
  name: 'Test business group',
  desc: 'Description',
)

# get group members
# https://events-api.webmoney.ru/Help/Api/GET-Group-Members

response = events.group.members('dc5d554c-2b3d-48fe-8a7d-a76c7deceb7e')
```

# Post requests

```ruby
# create new event post
# https://events-api.webmoney.ru/Help/Api/POST-Event-Post

response = events.event.create(
  group: 'a449bb54-ed78-4cd1-a16e-ed6f2a580216',
  text: 'This is a new, automatically generated event text'
)
```

# Widget comments requests

```ruby
# create
# https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-Create
# https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-CreateForEvent
response = events.widget.create(
  event: 252102785,
  url: 'https://news.dev.local',
  branches: 'tree',
  design: 'light'
)

# update
# https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-Update
response = events.widget.update(
  '31c64237-232d-489f-800c-5f75c98e31ac',
  {
    "abilityToDelete": 0,
    "designType": 0
  }
)

# delete
# https://events-api.webmoney.ru/Help/Api/POST-WidgetComments-Delete
response = events.widget.delete('31c64237-232d-489f-800c-5f75c98e31ac')

# list
# https://events-api.webmoney.ru/Help/Api/GET-WidgetComments-List_groupUid
response = events.widget.list('dc5d554c-2b3d-48fe-8a7d-a76c7deceb7e')

```

# Universal

```ruby
# Universal requests without parse
response = events.api_request(get: 'Feed/New').request

# Universal requests parse JSON
response = events.api_request(get: 'Feed/New').response

```
