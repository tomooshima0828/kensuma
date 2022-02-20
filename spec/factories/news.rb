FactoryBot.define do
  factory :news do
    title { 'MyString' }
    context { 'MyText' }
    delivered_at { '2022-02-15 07:59:49' }
    status { 1 }
  end
end
