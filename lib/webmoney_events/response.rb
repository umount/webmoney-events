module WebmoneyEvents
  module Response
    module ClassMethods
      def parse_request(&request)
        begin
          response = request.call
        rescue => error
          WebmoneyEvents::Errors::Internal.new(error)
        end

        if response.is_a?(RestClient::Response)
          if response.code == 200
            fetch_data(response)
          elsif response.code == 204
            response
          else
            raise WebmoneyEvents::Errors::ExternalServiceError.new(
              "#{response.code} / #{response.body}"
            )
          end
        else
          raise WebmoneyEvents::Errors::ExternalServiceError.new(
            "WTF? #{response.inspect}"
          )
        end
      end

      def fetch_data(response)
        _response = JSON.parse(response.body)
      end
    end

    extend ClassMethods
  end
end
