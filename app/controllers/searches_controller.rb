# app/controllers/searches_controller.rb
class SearchesController < ApplicationController
  before_action :capture_and_extract_octets, only: [:create]

  def create
    @user = User.find_or_create_by(ip_address: @three_octets)
    @search = @user.searches.new(search_params)

    if @search.save
      @user_searches = @user.searches
      render json: @search, status: :created
    else
      render json: { error: 'Unable to save search' }, status: :unprocessable_entity
    end
  end

  private

  def search_params
    params.require(:search).permit(:query)
  end

  def capture_and_extract_octets
    full_ip = request.remote_ip
    @three_octets = full_ip.split('.')[0, 3].join('.')
  end
end
