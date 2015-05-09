class ApplicationController < ActionController::API
  include AuthenticateByToken

  respond_to :json
end
