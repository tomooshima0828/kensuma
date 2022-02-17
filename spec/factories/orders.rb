FactoryBot.define do
  factory :order do
    status { 0 }
    site_uu_id { SecureRandom.uuid }
    sequence(:site_name) { |n| "site#{n}" }
    sequence(:order_name) { |n| "name#{n}" }
    order_post_code { '1000014' }
    sequence(:order_address) { |n| "address#{n}" }
    business
  end
end
