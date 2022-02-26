class CreateRequestOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :request_orders do |t|
      t.integer :status

      t.timestamps
    end
  end
end
