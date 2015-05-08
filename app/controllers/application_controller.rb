class ApplicationController < ActionController::API
  protected
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        User.find_by(auth_token: token)
      end
    end
end
