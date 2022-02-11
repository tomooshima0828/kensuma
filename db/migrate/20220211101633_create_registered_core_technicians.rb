class CreateRegisteredCoreTechnicians < ActiveRecord::Migration[6.1]
  def change
    create_table :registered_core_technicians do |t|
      t.string :name

      t.timestamps
    end
  end
end
