class RemoveUpdatedAtFromSearches < ActiveRecord::Migration[7.1]
  def change
    remove_column :searches, :updated_at
  end
end
