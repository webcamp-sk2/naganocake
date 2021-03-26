class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|

      t.string :last_name
      t.string :first_name
      t.string :last_name_kana
      t.string :first_name_kana
      t.string :email
      t.string :postal_code
      t.string :telephone_number
      t.string :address
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
