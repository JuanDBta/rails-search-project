# app/models/user.rb
class User < ApplicationRecord
    has_many :searches, foreign_key: :ip_address
  
    validates :ip_address, presence: true, uniqueness: true
  end
  