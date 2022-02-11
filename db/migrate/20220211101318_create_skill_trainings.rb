class CreateSkillTrainings < ActiveRecord::Migration[6.1]
  def change
    create_table :skill_trainings do |t|
      t.string :name
      t.string :short_name
      t.json :details

      t.timestamps
    end
  end
end
