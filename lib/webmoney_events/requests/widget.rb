module WebmoneyEvents
  module Requests
    class Widget
      include WebmoneyEvents::Requests::InstanceModule

      def create(params={}, options={})
        if params.has_key?(:event)
          api_request post: 'WidgetComments/CreateForEvent'
        else
          api_request post: 'WidgetComments/Create'
        end

        design_list = {default: 0, minimal: 1, light: 2}

        parse_params = {
          eventId: params[:event],
          url: params[:url],
          designType: design_list[params[:design].to_sym]
        }

        if params.has_key?(:branches) && params[:branches] == 'tree'
          parse_params.merge!({treeBranches: 1})
        end

        parse_params.merge!(options)

        response(parse_params)
      end

      def update(uid, params)
        api_request post: 'WidgetComments/Update'

        parse_params = {
          ident: { uid: uid }
        }.merge(params)

        response(parse_params)
      end

      def delete(uid)
        api_request post: 'WidgetComments/Delete'

        response({uid: uid})
      end

      def list(group_uid)
        api_request get: 'WidgetComments/List'

        response({groupUid: group_uid})
      end
    end
  end
end
