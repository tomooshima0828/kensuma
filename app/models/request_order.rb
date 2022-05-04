class RequestOrder < ApplicationRecord
  belongs_to :order
  belongs_to :business
  has_many :documents, dependent: :destroy

  enum status: { editing: 0, completed: 1, request: 2, submitted: 3 }

  has_closure_tree

  validates :business_id, uniqueness: { scope: :order_id }

  before_create -> { self.uuid = SecureRandom.uuid }

  def to_param
    uuid
  end
end
