class RenameAddressColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :orders,:address,:order_address
  end
end
