class CreateSkillTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_trainings do |t|
      t.string :name, null: false
      t.string :short_name, null: false
      t.json :allocation_numbers

      t.timestamps
    end
  end
end
