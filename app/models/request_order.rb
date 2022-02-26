class RequestOrder < ApplicationRecord
  enum status: { editing: 0, completed: 1, request:2 }
end
