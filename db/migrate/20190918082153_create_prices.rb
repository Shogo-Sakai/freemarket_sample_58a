class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.integer :sell,        null: false
      t.integer :fee,         null: false
      t.integer :benefit,     null: false
      t.references :products, foreign_key: true

      t.timestamps
    end
  end
end
