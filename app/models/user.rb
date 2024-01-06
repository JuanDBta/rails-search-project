# app/models/user.rb
class User < ApplicationRecord
  has_many :searches, foreign_key: :user_id, dependent: :destroy

  validates :ip_address, presence: true, uniqueness: true
end
