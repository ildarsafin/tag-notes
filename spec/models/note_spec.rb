require 'rails_helper'

RSpec.describe Note, :type => :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to have_and_belong_to_many(:tags) }
  end
end
