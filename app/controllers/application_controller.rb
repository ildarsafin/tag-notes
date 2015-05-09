class ApplicationController < ActionController::API
  include ActionController::ImplicitRender
  include AuthenticateByToken

  respond_to :json
end
