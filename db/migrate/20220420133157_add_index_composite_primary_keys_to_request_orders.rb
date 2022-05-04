class AddIndexCompositePrimaryKeysToRequestOrders < ActiveRecord::Migration[6.1]
  def change
    add_index :request_orders, [:business_id, :order_id], unique: true 
  end
end
