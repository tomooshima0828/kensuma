class Worker < ApplicationRecord
  belongs_to :businesses

  enum abo_blood_type: { a: 0, b: 1, ab: 2, o: 3 }
  enum rh_blood_type: { plus: 0, minus: 1 }
  # ↓内訳未定のためコメントアウト
  # enum job_type: {  }

  validates :name,  presence: true
  validates :name_kana,  presence: true
  validates :country,  presence: true
  validates :my_address,  presence: true
  validates :my_phone_number,  presence: true
  validates :family_address,  presence: true
  validates :family_phone_number,  presence: true
  validates :birth_day_on,  presence: true
  validates :abo_blood_type,  presence: true
  validates :rh_blood_type,  presence: true
  validates :job_type,  presence: true
  validates :hiring_on,  presence: true
  validates :experience_term_before_hiring,  presence: true
  validates :blank_term,  presence: true
end
