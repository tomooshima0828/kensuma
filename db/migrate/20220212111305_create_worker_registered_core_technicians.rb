class CreateWorkerRegisteredCoreTechnicians < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_registered_core_technicians do |t|
      t.date :got_on, null: false
      t.json :images
      t.references :worker, foreign_key: true, null: false
      t.references :regd_core_tech, foreign_key: { to_table: :registered_core_technicians }, null: false

      t.timestamps
    end
    add_index :worker_registered_core_technicians,
              [:worker_id, :regd_core_tech_id],
              unique: true, 
              name: 'worker_registered_core_technicians_index'
  end
end
