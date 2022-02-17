class Order < ApplicationRecord
  belongs_to :business

  validates :status, presence: true
  validates :site_uu_id, presence: true
  validates :site_name, presence: true
  validates :order_name, presence: true
  validates :order_post_code, presence: true
  validates :order_address, presence: true
end
