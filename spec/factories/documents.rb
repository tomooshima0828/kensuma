FactoryBot.define do
  factory :document do
    uuid { SecureRandom.uuid }
    document_type { 0 }
    created_on { '2022-03-08' }
    submitted_on { '2022-03-08' }
    content {}
    business
    request_order
  end
end
