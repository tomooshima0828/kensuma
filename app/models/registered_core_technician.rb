class RegisteredCoreTechnician < ApplicationRecord
  has_many :worker_registered_core_technicians, foreign_key: 'regd_core_tech_id', dependent: :destroy
  has_many :workers, through: :worker_registered_core_technicians

  validates :name, presence: true
end
