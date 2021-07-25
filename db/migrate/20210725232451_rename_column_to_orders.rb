class RenameColumnToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_column :order_items,:orders_id,:order_id
    rename_column :order_items,:items_id,:item_id
  end
end
