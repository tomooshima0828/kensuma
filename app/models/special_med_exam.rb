class SpecialMedExam < ApplicationRecord
  has_many :worker_exams # 中間テーブル
  has_many :worker_medicals, through: :worker_exams
  has_many :workers, through: :worker_medicals
end
