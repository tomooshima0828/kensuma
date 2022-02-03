class CreateCarVoluntaryInsurances < ActiveRecord::Migration[6.1]
  def change
    create_table :car_voluntary_insurances do |t|
      t.integer :personal_insurance
      t.integer :objective_insurance
      t.integer :car_id
      t.integer :car_insurance_company_id

      t.timestamps
    end
  end
end
