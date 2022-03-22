class Document < ApplicationRecord
  has_one :cover_document, dependent: :destroy
  has_one :table_of_contents_document, dependent: :destroy
  has_one :second_document, dependent: :destroy

  before_create -> { self.uuid = SecureRandom.uuid }

  def to_param
    uuid
  end
end
