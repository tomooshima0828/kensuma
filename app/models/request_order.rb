class RequestOrder < ApplicationRecord
  belongs_to :order_request, class_name: 'Order', foreign_key: 'order_request_id'
  belongs_to :business_request, class_name: 'Business', foreign_key: 'business_request_id'

  enum status: { editing: 0, completed: 1, request:2 }
end
