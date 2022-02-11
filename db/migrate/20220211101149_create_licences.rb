class CreateLicences < ActiveRecord::Migration[6.1]
  def change
    create_table :licences do |t|
      t.string :name
      t.string :description
      t.integer :type

      t.timestamps
    end
  end
end
