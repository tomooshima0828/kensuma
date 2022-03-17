class CreateWorkerExaminations < ActiveRecord::Migration[6.1]
  def change
    create_table :worker_examinations do |t|
      t.references :worker_medical, null: false, foreign_key: true
      t.references :special_medical_examination, null: false, foreign_key: true
      t.date :got_on, null: false
      t.json :images

      t.timestamps
    end
  end
end
