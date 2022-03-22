FactoryBot.define do
  factory :worker_medical do
    worker { nil }
    med_exam_on { "2022-03-16" }
    special_med_exam_on { "2022-03-16" }
    max_blood_pressure { 1 }
    min_blood_pressure { 1 }
  end
end
