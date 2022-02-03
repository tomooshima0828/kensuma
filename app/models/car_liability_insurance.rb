class CarLiabilityInsurance < ApplicationRecord
  belongs_to :car
  belongs_to :car_insurance_company
end
