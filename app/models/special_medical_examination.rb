class SpecialMedicalExamination < ApplicationRecord
  has_many :worker_examinations # 中間テーブル
end
