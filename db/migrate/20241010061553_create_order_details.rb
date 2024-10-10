class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :order_id, null: false
      t.integer :item_id, null: false
      t.integer :pric, null: false
      t.integer :amount, null: false
      t.integer :making_status, null: false, default: "1"

      t.timestamps
    end
  end
end
