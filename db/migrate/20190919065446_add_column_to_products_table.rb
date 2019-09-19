class AddColumnToProductsTable < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :bigcategory, foreign_key:true
    add_reference :products, :smallcategory, foreign_key:true
  end
end
