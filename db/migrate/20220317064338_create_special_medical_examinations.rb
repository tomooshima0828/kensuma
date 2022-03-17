class CreateSpecialMedicalExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :special_medical_examinations do |t|
      t.string :name

      t.timestamps
    end
  end
end
