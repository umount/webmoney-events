module WebmoneyEvents
  module Requests
    class Event
      include WebmoneyEvents::Requests::InstanceModule

      def create(params={}, options={})
        api_request post: 'Event/Post'

        parse_params = {
          "groupUid": params[:group],
          "postText": params[:text]
        }.merge(options)

        response(parse_params)
      end
    end
  end
end
