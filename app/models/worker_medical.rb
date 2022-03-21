class WorkerMedical < ApplicationRecord
  belongs_to :worker # Workerにhas_oneを設定
  has_many :worker_examinations, dependent: :destroy # 中間テーブル

  validates :medical_examination_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
