# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:ip_address) }
    it { should validate_uniqueness_of(:ip_address).case_insensitive }
  end

  describe 'associations' do
    it { should have_many(:searches).dependent(:destroy).with_foreign_key(:user_id) }
  end
end
