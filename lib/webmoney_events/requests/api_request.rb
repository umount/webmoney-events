module WebmoneyEvents
  module Requests
    class ApiRequest
      attr_accessor :requests_params

      include WebmoneyEvents::Requests::InstanceModule

      def initialize(params={})
        self.requests_params = params

        self
      end

      def config=(config)
        @config = config

        api_request requests_params

        self
      end

      def config
        @config
      end
    end
  end
end
