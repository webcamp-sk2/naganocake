class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.integer :public_id
      t.string :name
      t.string :postal_code
      t.string :address

      t.timestamps
    end
  end
end
