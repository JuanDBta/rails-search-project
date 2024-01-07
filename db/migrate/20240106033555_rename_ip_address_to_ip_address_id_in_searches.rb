class RenameIpAddressToIpAddressIdInSearches < ActiveRecord::Migration[7.1]
  def change
    rename_column :searches, :ip_address, :ip_address_id
  end
end
