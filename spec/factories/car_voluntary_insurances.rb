FactoryBot.define do
  factory :car_voluntary_insurance do
    personal_insurance { 1 }
    objective_insurance { 1 }
    car_id { 1 }
    car_insurance_company_id { 1 }
  end
end
