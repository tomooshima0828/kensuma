class WorkerMedical < ApplicationRecord
  belongs_to :worker # Workerにhas_oneを設定
  has_many :worker_exams, dependent: :destroy # 中間テーブル

  validates :med_exam_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
