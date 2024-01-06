# app/models/search.rb
class Search < ApplicationRecord
  belongs_to :user, foreign_key: :user_id

  validates :query, presence: true, length: { minimum: 7, message: 'Please make a valid search' }

  validate :valid_search

  private

  def valid_search
    return unless query.present?

    spaces_count = query.scan(/\s/).size
    words_count = query.scan(/\S+/).size

    return if spaces_count >= 2 && words_count >= 3

    errors.add(:query, 'Please make a valid search')
  end
end
