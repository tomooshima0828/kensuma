class WorkerRegisteredCoreTechnician < ApplicationRecord
  belongs_to :worker
  belongs_to :registered_core_technician, foreign_key: 'regd_core_tech_id'

  validates :got_on, presence: true
end
