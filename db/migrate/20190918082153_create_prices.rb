class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :sell,        null: false
      t.integer :fee,         null: false
      t.integer :benefit,     null: false
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
