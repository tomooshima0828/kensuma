class RemoveINdexCompositePrimaryKeysToRequestOrders < ActiveRecord::Migration[6.1]
  def change
    remove_index :request_orders, [:business_id, :order_id]
  end
end
