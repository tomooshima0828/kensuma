class CreateTableOfContentsDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :table_of_contents_documents do |t|
      t.references :document, null: false, foreign_key: true
      t.json :details

      t.timestamps
    end
  end
end
