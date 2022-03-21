FactoryBot.define do
  factory :worker_skill_training do
    got_on { '2022-02-12' }
    images { '' }
    association :worker
    association :skill_training
  end
end
