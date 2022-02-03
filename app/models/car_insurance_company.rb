class CarInsuranceCompany < ApplicationRecord
  has_many :car_liability_insurances
  has_many :cars, through: :car_liability_insurances
end
