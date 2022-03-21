class SpecialMedicalExamination < ApplicationRecord
  has_many :worker_examinations # 中間テーブル
  has_many :worker_medicals, through: :worker_examinations
  has_many :workers, through: :worker_medicals
end
