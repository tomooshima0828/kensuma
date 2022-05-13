class CreateBusinessOccupations < ActiveRecord::Migration[6.1]
  def change
    create_table :business_occupations do |t|
      t.references :businesses, null: false, foreign_key: true
      t.references :occupations, null: false, foreign_key: true

      t.timestamps
    end
  end
end
