module WebmoneyEvents
  module Requests
    class Class
      def initialize(params={})
        configure(params)
      end

      def configure(config=false)
        @config = config || @config
      end

      def method_missing(method_name, *args, &block)
        class_path = method_name.to_s.split(/\_/).map(&:capitalize).join('')
        class_name = "WebmoneyEvents::Requests::#{class_path}"

        if Object.const_defined?(class_name)
          _instanse = Object.const_get(class_name).new(*args)
          _instanse.config = @config
          _instanse
        else
          super
        end
      end
    end

    module InstanceModule
      mattr_accessor :config, :request_method, :request_url

      def response(params={})
        WebmoneyEvents::Response.parse_request do
          request(params)
        end
      end

      def request(params={})
        headers = {accessToken: config[:access_token]}

        RestClient::Request.execute(
          method: request_method,
          url: request_url,
          params: params,
          headers: headers
        )
      end

      def api_request(params)
        self.request_method = params.keys[0]
        self.request_url = "#{config[:api_url]}/#{params[request_method]}"

        self
      end
    end
  end
end
