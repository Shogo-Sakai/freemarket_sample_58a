class CreateSmallcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :smallcategories do |t|
      t.string     :name,          null: false
      t.references :bigcategories, foreign_key: true

      t.timestamps
    end
  end
end
