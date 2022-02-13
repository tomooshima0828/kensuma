class License < ApplicationRecord
  has_many :worker_licenses, dependent: :destroy
  has_many :workers, through: :worker_licenses

  # ↓内訳未定のためコメントアウト
  # enum license_type: {  }

  validates :name, presence: true
  validates :type, presence: true
end
