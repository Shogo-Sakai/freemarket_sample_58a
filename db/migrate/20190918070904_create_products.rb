class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string     :name            
      t.string     :text             
      t.string     :fresh_status     
      t.integer    :user_id
      t.string     :sell_status   

      t.timestamps
    end
  end
end
