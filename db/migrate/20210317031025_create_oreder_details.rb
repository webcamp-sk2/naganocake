class CreateOrederDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :oreder_details do |t|

      t.timestamps
    end
  end
end
