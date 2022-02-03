class Car < ApplicationRecord
  belongs_to :business
  has_one :car_liability_insurance
  has_one :car_insurance_company, through: :car_liability_insurance
  mount_uploaders :images, ImagesUploader

  validates :owner_name, presence: true
  validates :vehicle_model, presence: true
  validates :vehicle_number, presence: true
  validates :vehicle_inspection_start_on, presence: true
  validates :vehicle_inspection_end_on, presence: true
  validates :liability_securities_number, presence: true
  validates :liability_insurance_start_on, presence: true
  validates :liability_insurance_end_on, presence: true
end
