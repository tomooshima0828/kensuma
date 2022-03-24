class WorkerMedical < ApplicationRecord
  belongs_to :worker # Workerにhas_oneを設定
  has_many :worker_exams, dependent: :destroy # 中間テーブル
  has_many :special_med_exams, through: :worker_exams
  accepts_nested_attributes_for :worker_exams, allow_destroy: true

  validates_presence_of :worker

  validates :med_exam_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
