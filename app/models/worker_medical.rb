class WorkerMedical < ApplicationRecord
  belongs_to :worker # Workerにhas_oneを設定
  has_many :worker_examinations, dependent: :destroy # 中間テーブル
  has_many :special_medical_examinations, through: :worker_examinations

  validates :medical_examination_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
