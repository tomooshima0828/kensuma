class Order < ApplicationRecord
  belongs_to :business
  before_create -> { self.site_uu_id = SecureRandom.uuid }

  validates :status, presence: true
  validates :site_uu_id, presence: true
  validates :site_name, presence: true
  validates :order_name, presence: true
  validates :order_post_code, presence: true
  validates :order_address, presence: true

  enum status: { created: 0, completed: 1 }
end
