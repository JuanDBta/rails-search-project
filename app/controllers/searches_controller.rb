# app/controllers/searches_controller.rb
class SearchesController < ApplicationController
  before_action :find_user, only: [:index]

  def index
    @searches = @user.searches
    render json: @searches, status: :ok
  end

  def create
    @search = Search.new(search_params)
    @search.ip_address = user_ip

    if search_complete?(@search.query) && @search.save
      render json: @search, status: :created
    else
      render json: { error: "Invalid search" }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find_by(ip_address: params[:ip_address])
    render json: { error: "User not found" }, status: :not_found unless @user
  end

  def search_params
    params.require(:search).permit(:query, :ip_address)
  end

  def search_complete?(query)
    query.length > 7
  end

  def user_ip
    request.remote_ip
  end
end
