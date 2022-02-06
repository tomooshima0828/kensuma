class CarVoluntaryInsurance < ApplicationRecord
  belongs_to :car_voluntary, class_name: 'Car', foreign_key: 'car_voluntary_id'
  belongs_to :company_voluntary, class_name: 'CarInsuranceCompany', foreign_key: 'company_voluntary_id'
end
