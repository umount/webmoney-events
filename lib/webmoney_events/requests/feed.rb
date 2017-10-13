module WebmoneyEvents
  module Requests
    class Feed
      include WebmoneyEvents::Requests::InstanceModule

      def get(params={})
        api_request get: 'Feed/Get'

        response(params)
      end
    end
  end
end
