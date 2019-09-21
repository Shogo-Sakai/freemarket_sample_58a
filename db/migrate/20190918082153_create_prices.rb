class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :sell
      t.integer :fee
      t.integer :benefit
      t.references :product,  foreign_key: true

      t.timestamps
    end
  end
end
