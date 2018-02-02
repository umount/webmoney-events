module WebmoneyEvents
  module Errors
    class CustomError < StandardError
      cattr_accessor :code
      attr_reader :description

      def initialize(description = nil)
        super(description)
        @description = description
      end

      self.code = 399
    end

    class BadRequest < CustomError;                 self.code = 400 end
    class UnauthorizedAccess < CustomError;         self.code = 401 end
    class Forbidden < CustomError;                  self.code = 403 end
    class NotFound < CustomError;                   self.code = 404 end
    class TooManyRequests < CustomError;            self.code = 429 end
    class Internal < CustomError;                   self.code = 500 end
    class ExternalServiceError < CustomError;       self.code = 503 end
  end
end
