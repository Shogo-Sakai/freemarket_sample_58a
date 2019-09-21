class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :fee_person,    null:false
      t.string :from_area,       null:false
      t.string :sending_day,         null:false
      t.string :deliver_way,         null:false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
