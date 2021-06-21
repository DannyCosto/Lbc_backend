class AddCounterToItemOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :item_orders, :counter, :integer, default: 1
  end
end
