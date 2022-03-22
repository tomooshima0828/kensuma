class WorkerExam < ApplicationRecord
  belongs_to :worker_medical
  belongs_to :special_med_exam
  
  validates :worker_medical, uniqueness: { scope: :special_med_exam } 
  validates :got_on, presence: true
end
