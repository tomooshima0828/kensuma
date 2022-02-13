class WorkerSkillTraining < ApplicationRecord
  belongs_to :worker
  belongs_to :skill_training

  validates :got_on, presence: true
end
