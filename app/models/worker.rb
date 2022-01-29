class Worker < ApplicationRecord
  belongs_to :business

  validates :name, presence: true
  validates :name_kana, presence: true, format: { with: /\A[ァ-ヴー]+\z/u, message: 'はカタカナで入力して下さい。' }
  validates :country, presence: true
  validates :my_address, presence: true
  validates :my_phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :family_address, presence: true
  validates :family_phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :birh_day_on, presence: true
  validates :abo_blood_type, presence: true
  validates :rh_blood_type, presence: true
  validates :job_type, presence: true
  validates :hiring_on, presence: true
  validates :experience_term_before_hiring, presence: true
  validates :blank_term, presence: true

  enum abo_blood_type: { a: 0, b: 1, ab: 2, o: 3 }
  enum rh_blood_type: { plus: 0, minus: 1 }


end
