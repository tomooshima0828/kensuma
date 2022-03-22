class SpecialMedExam < ApplicationRecord
  has_many :worker_exams # 中間テーブル
  has_many :worker_medicals, through: :worker_exams
end
