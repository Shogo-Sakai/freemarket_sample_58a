class AddBrandColumnToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference  :products, :brand, foreign_key: true
    add_reference  :products, :category_index, foreign_key: true

  end
end