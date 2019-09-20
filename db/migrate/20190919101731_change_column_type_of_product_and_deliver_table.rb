class ChangeColumnTypeOfProductAndDeliverTable < ActiveRecord::Migration[5.2]
  def change
    change_column :products, :fresh_status, :string
    change_column :products, :sell_status,  :string

    change_column :deliveries, :day_id,     :string
    rename_column :deliveries, :day_id,     :sending_day
    change_column :deliveries, :fee_person, :string
    change_column :deliveries, :how_id,     :string
    rename_column :deliveries, :how_id,     :deliver_way

  end
end
