class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :checked_out, default: false

      t.timestamps
    end
  end
end
