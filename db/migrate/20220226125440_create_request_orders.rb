class CreateRequestOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :request_orders do |t|
      t.integer :status

      t.references :order_request, foreign_key: { to_table: :orders }, null: false
      t.references :business_request, foreign_key: { to_table: :businesses }, null: false
      t.timestamps
    end
  end
end
