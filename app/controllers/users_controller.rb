# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.new(ip_address: request.remote_ip)

    if @user.save
      render json: { message: 'User created successfully' }, status: :created

    else
      render json: { error: 'Unable to create user', details: @user.errors.full_messages }, status: :unprocessable_entity

    end
  end

  def index
    @users = User.all
    render json: @users, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def show_searches
    ip_address = request.remote_ip
    user = User.find_by(ip_address:)

    if user
      searches = user.searches.order(created_at: :desc).limit(15)
      render json: searches
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def count_searches
    ip_address = request.remote_ip
    user = User.find_by(ip_address:)

    if user
      searches_count = user.searches.count
      render json: { searches_count: }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
