class SpecialMedicalExamination < ApplicationRecord
  has_many :worker_examinations, dependent: :destroy
  has_many :worker_medicals, through: :worker_examinations
end
