class Document < ApplicationRecord
  has_one :cover_document

  before_create -> { self.uuid = SecureRandom.uuid }
  self.inheritance_column = :_type_disabled

  def to_param
    uuid
  end
end
