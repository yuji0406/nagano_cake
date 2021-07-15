class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :orders_id
      t.integer :items_id
      t.integer :amount
      t.integer :price
      t.integer :status,default: 0

      t.timestamps
    end
  end
end
