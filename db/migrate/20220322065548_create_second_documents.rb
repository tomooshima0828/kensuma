class CreateSecondDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :second_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.json :details

      t.timestamps
    end
  end
end
