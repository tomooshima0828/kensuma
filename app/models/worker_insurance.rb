class WorkerInsurance < ApplicationRecord
  belongs_to :worker

  validates :health_insurance_type, presence: true
  validates :pension_insurance_type, presence: true
  validates :employment_insurance_type, presence: true
  validates :severance_pay_mutual_aid_type, presence: true
end
