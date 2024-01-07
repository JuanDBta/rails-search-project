require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  include FactoryBot::Syntax::Methods
  let(:user) { create(:user) }

  describe 'GET /users/:user_id/searches' do
    it 'returns http success' do
      get "/users/#{user.id}/searches"
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /users/:user_id/searches' do
    it 'returns http success' do
      post "/users/#{user.id}/searches", params: { search: { query: 'a new example', user_id: user.id } }
      expect(response).to have_http_status(:success)
    end
  end
end
