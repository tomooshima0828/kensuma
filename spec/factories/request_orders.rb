FactoryBot.define do
  factory :request_order do
    uuid { SecureRandom.uuid }
    status { 0 }
    order
    business
  end
end
