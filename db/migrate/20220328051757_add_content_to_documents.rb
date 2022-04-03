class AddContentToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_column :documents, :content, :json
  end
end
