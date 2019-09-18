class CreateBigcategories < ActiveRecord::Migration[5.2]
  def change
    create_table :bigcategories do |t|
      t.string     :name,             null: false
      t.references :category_indices, foreign_key: true

      t.timestamps
    end
  end
end
