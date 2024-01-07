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

  def favorite_word
    ip_address = request.remote_ip
    user = User.find_by(ip_address:)

    if user
      searches = user.searches.pluck(:query).join(' ').downcase.split(/\W+/)
      filtered_words = searches.select { |word| word.length > 3 }

      word_frequency = filtered_words.tally
      most_frequent_word = word_frequency.max_by { |_word, frequency| frequency }&.first

      render json: { most_frequent_word: }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def average_words_per_search
    ip_address = request.remote_ip
    user = User.find_by(ip_address:)

    if user
      searches = user.searches.pluck(:query)
      total_words = searches.map { |search| search.downcase.split(/\W+/).length }.sum
      total_searches = searches.length

      average_words = total_searches.positive? ? total_words.to_f / total_searches : 0

      render json: { average_words_per_search: average_words }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
