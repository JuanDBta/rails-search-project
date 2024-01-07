class AddUserReferenceToSearches < ActiveRecord::Migration[7.1]
  def change
    add_reference :searches, :user, foreign_key: true
  end
end
