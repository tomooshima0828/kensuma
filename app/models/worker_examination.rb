class WorkerExamination < ApplicationRecord
  belongs_to :worker_medical
  belongs_to :worker, through: :worker_medical
  belongs_to :special_medical_examination

  validates :got_on, presence: true
end
