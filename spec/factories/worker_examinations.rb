FactoryBot.define do
  factory :worker_examination do
    worker_medical { nil }
    special_medical_examination { nil }
    got_on { "2022-03-17" }
    images { "" }
  end
end
