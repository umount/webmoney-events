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
    end
  end
end
