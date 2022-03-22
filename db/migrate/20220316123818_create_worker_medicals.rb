class CreateWorkerMedicals < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_medicals do |t|
      t.references :worker, null: false, foreign_key: true
      t.date :med_exam_on, null: false
      t.integer :max_blood_pressure, null: false
      t.integer :min_blood_pressure, null: false
      t.date :special_med_exam_on

      t.timestamps
    end
  end
end
