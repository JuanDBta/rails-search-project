# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = User.create(ip_address: '127.0.0.1')
  end

  describe "POST #create" do
    it "creates a new user" do
      post :create, params: { user: { ip_address: '127.0.0.1' } }, format: :json
      expect(response).to have_http_status(:created)
    end
  end
      
  describe "GET #show" do
    it "returns a success response" do
      get :show, params: { id: @user.id }
      expect(response).to have_http_status(:ok)
    end
  end

  end
