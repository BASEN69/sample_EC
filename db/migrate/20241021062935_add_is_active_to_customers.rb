class AddIsActiveToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :is_active, :boolean, default: true, null: false
  end
end
