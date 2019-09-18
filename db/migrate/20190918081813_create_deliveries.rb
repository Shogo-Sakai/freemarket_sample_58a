class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.integer :fee_person,    null:false
      t.string :from_area,       null:false
      t.integer :day_id,         null:false
      t.integer :how_id,         null:false
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
