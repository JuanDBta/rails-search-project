# app/models/search.rb
class Search < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
end
