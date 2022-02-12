class WorkerLicense < ApplicationRecord
  belongs_to :worker
  belongs_to :license

  validates :got_on, presence: true
end
