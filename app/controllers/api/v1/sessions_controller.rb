class Api::V1::SessionsController < Devise::SessionsController
  wrap_parameters :user

  def create
    user = authenticated_user
    render json: user
  end

  private
    OPTIONS = { store: false, scope: :user }
    def authenticated_user
      warden.authenticate!(OPTIONS).tap do |user|
        user.ensure_access_token
      end
    end
end
