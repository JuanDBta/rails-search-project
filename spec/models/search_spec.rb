# spec/models/search_spec.rb
require 'rails_helper'

RSpec.describe Search, type: :model do
  describe 'associations' do
    it { should belong_to(:user).with_foreign_key(:user_id) }
  end
end
