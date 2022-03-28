class AddReferencesToDocuments < ActiveRecord::Migration[6.1]
  def change
    add_reference :documents, :business, index: true, foreign_key: true, null: false
    add_reference :documents, :request_order,  index: true, foreign_key: true, null: false
  end
end
