module AuthenticateByToken
  extend ActiveSupport::Concern

  def authenticate_user!
    authenticate_user_from_token!
    super
  end

  def authenticate_user_from_token!
    user = user_token && User.find_by_access_token(user_token)

    sign_in(user, store: false) if user
  end

  private

  def user_token
    request.headers['X-AUTH-TOKEN'].presence || params['auth_token'].presence
  end
end
