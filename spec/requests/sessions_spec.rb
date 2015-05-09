require 'rails_helper'
require 'rspec_api_documentation/dsl'

resource 'Sessions' do
  post '/api/v1/users/sign_in' do
    let!(:user) { create :user, password: '12345678' }

    parameter :email, 'Email', required: true
    parameter :password, 'Password', required: true

    let!(:email) { user.email }

    example_request 'Sign in with valid password', password: '12345678' do
      expect(response_body).to eq(user.to_json)
    end

    example_request 'Sign in with invalid password', password: '' do
      expect(response_status).to eq 401
    end
  end
end
