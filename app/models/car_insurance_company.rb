class CarInsuranceCompany < ApplicationRecord
  has_many :car_liability_insurances, class_name: 'CarLiabilityInsurance', foreign_key: :company_liability_id, dependent: :destroy
  delegate :car_liability, to: :car_liability_insurance

  has_many :car_voluntary_insurances, class_name: 'CarVoluntaryInsurance', foreign_key: :company_voluntary_id, dependent: :destroy
  has_many :car_voluntaries, through: :car_voluntary_insurances, source: :car_voluntary

  accepts_nested_attributes_for :car_liability_insurances, allow_destroy: true
  accepts_nested_attributes_for :car_voluntary_insurances, allow_destroy: true

  validates :name, presence: true
end
