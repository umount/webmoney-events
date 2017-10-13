require 'rest-client'
require 'json'

require 'webmoney_events/version'
require 'webmoney_events/errors'
require 'webmoney_events/response'
require 'webmoney_events/requests'

Dir[
    File.expand_path('../webmoney_events/requests/*.rb', __FILE__)
].each { |f|
  require f
}

module WebmoneyEvents
  module ClassMethods
    def new(config)
      configure(config)

      WebmoneyEvents::Requests::Class.new(@config)
    end

    def configure(config={})
      @config = {
        api_url: 'https://events-api.webmoney.ru',
        access_token: false
      }.merge!(config)
    end
  end

  extend ClassMethods
end
