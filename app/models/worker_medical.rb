class WorkerMedical < ApplicationRecord
  belongs_to :worker
  has_many :worker_exams, dependent: :destroy # 中間テーブル
  has_many :special_med_exams, through: :worker_exams
  accepts_nested_attributes_for :worker_exams, allow_destroy: true,
    reject_if:     proc { |attributes| attributes['special_med_exam_id'].blank? }

  validates :med_exam_on, presence: true
  validates :max_blood_pressure, presence: true
  validates :min_blood_pressure, presence: true
end
