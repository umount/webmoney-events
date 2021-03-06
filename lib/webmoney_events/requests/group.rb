module WebmoneyEvents
  module Requests
    class Group
      include WebmoneyEvents::Requests::InstanceModule

      def create(params={}, options={})
        api_request post: 'Group/CreateRegular'

        visibility_list = {public: 0, private:1, secret: 2, wmpublic: 3}

        parse_params = {
          "visibility": visibility_list[params[:visibility].to_sym],
          "name": params[:name],
          "shortDesc": params[:desc],
        }.merge(options)

        response(parse_params)
      end

      def info(uid)
        api_request get: 'Group/Info'

        response({groupUid: uid})
      end

      def hide(uid)
        api_request post: 'Group/Hide'

        response({groupUid: uid})
      end

      def leave(uid)
        api_request post: 'Group/Leave'

        response({groupUid: uid})
      end

      def create_business(params={}, options={})
        api_request post: 'Group/CreateBusiness'

        parse_params = {
          "name": params[:name],
          "shortDesc": params[:desc],
        }.merge(options)

        response(parse_params)
      end

      def members(uid, options={})
        api_request get: 'Group/Members'

        parse_params = {"groupUid": uid}.merge(options)

        response(parse_params)
      end

      def remove_member(uid, wmid)
        api_request post: 'Group/RemoveFromGroup'

        response({"groupUid": uid, "wmid": wmid})
      end

      def set_admin(uid, wmid)
        api_request post: 'Group/SetAdminRights'

        response({"groupUid": uid, "wmid": wmid})
      end
    end
  end
end
