class WorkerMedical < ApplicationRecord
  belongs_to :worker # Workerにhas_oneを設定

  validates :medical_examination_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
