class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :quantity, null: false
      t.integer :item_price, null: false
      t.integer :item_status, null: false, default: 0
      t.timestamps
    end
  end
end
