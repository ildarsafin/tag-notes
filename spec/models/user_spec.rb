require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'uniqueness' do
      it { is_expected.to validate_uniqueness_of :email }
    end
  end

  describe 'callbacks' do
    describe 'before save' do
      it 'calls #ensure_access_token' do
        user = build :user
        allow(user).to receive(:ensure_access_token)

        user.save
      end
    end
  end

  describe '#ensure_access_token' do
    let(:user) { described_class.new(access_token: token) }
    let(:callback) { -> { user.ensure_access_token } }

    context 'when token exists' do
      let(:token) { 'token' }

      it 'leaves it as is' do
        expect(callback).not_to change(user, 'access_token')
      end
    end

    context 'when token does NOT exist' do
      let(:token) { '' }

      it 'generates new access_token' do
        expect(callback).to change(user, 'access_token')
      end
    end
  end
end
