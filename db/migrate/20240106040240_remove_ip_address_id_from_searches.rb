class RemoveIpAddressIdFromSearches < ActiveRecord::Migration[7.1]
  def change
    remove_column :searches, :ip_address_id, :string
  end
end
