# app/controllers/searches_controller.rb
class SearchesController < ApplicationController
  def create
    @user = User.find_or_create_by(ip_address: request.remote_ip)
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
end
