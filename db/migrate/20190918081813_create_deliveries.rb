class CreateDeliveries < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveries do |t|
      t.string :fee_person
      t.string :from_area
      t.string :sending_day
      t.string :deliver_way
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
