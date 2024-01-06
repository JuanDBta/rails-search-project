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
    # Capturar la ip_address de la solicitud
    ip_address = request.remote_ip

    # Buscar el user_id asociado a la ip_address
    user = User.find_by(ip_address:)

    if user
      # Obtener todas las búsquedas asociadas al user_id encontrado
      searches = user.searches
      render json: searches
    else
      render json: { error: 'Usuario no encontrado' }, status: :not_found
    end
  end
end
