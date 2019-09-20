class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name,             null: false
      t.string     :text,             null: false
      t.integer    :fresh_status,  null: false
      t.integer    :user_id
      t.integer    :sell_status,   null: false
      t.integer    :size_id

      t.timestamps
    end
  end
end
