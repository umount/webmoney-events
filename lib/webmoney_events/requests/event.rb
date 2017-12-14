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

      def delete(id)
        api_request post: 'Event/Del'

        response({eventId: id})
      end

      def hide(id)
        api_request post: 'Event/Hide'

        response({eventId: id})
      end

      def update(params={})
        api_request post: 'Event/Update'

        response(params)
      end
    end
  end
end
