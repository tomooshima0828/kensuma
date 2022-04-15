class Document < ApplicationRecord
  belongs_to :business
  belongs_to :request_order

  before_create -> { self.uuid = SecureRandom.uuid }

  enum document_type: {
    cover_document:             0,
    table_of_contents_document: 1,
    doc_2nd:                    2,
    doc_3rd:                    3,
    doc_4th:                    4,
    doc_5th:                    5,
    doc_6th:                    6,
    doc_7th:                    7,
    doc_8th:                    8
  }

  def to_param
    uuid
  end
end
