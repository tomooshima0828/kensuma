FactoryBot.define do
  factory :document do
    uuid { SecureRandom.uuid }
    document_type { 0 }
    created_on { '2022-03-08' }
    submitted_on { '2022-03-08' }
    content { }
    business
    request_order

    # 表紙
    trait :cover do
      document_type { 0 }
      content do
        {
          'business_name': 'test1',
          'submitted_on':  '2022-01-01'
        }
      end
    end

    # 目次
    trait :table do
      document_type { 1 }
      content { {} }
    end

    # 施工体制台帳作成建設工事の通知
    trait :doc_2nd do
      document_type { 2 }
      content do
        {
          'submitted_on':           '2022-01-01',
          'prime_contractor_name':  'test1',
          'site_name':              'test2',
          'business_name':          'test3',
          'orderer_name':           'test4',
          'construction_name':      'test5',
          'supervisor_name':        'test6',
          'apply':                  'test7',
          'submission_destination': 'test8'
        }
      end
    end
  end
end
