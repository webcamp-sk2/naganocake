class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :public_id
      t.integer :postal_code
      t.string  :address
      t.string  :name
      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method, default: 0
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
