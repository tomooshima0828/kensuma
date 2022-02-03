class CreateCarLiabilityInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :car_liability_insurances do |t|
      t.integer :car_id
      t.integer :car_insurance_company_id

      t.timestamps
    end
  end
end
