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

    # 作業員名簿
    trait :doc_5th do
      document_type { 5 }
      content do
        {
          'doc5_8_001_business_name':         'test1',
          'doc5_8_002_site_id':               'test2',
          'doc5_8_003_site_agent':            'test3',
          'doc5_8_004_created_date':          '2020-0101',
          'doc5_8_005_primary_business_name': 'test5',
          'doc5_8_006_primary_business_id':   'test6',
          'doc5_8_007_hierarchy':             'test7',
          'doc5_8_009_my_business_name':      'test9',
          'doc5_8_010_my_business_id':        'test10',
          'doc5_8_011_submitted_on':          '2020-01-01',
          'doc5_8_042_confirmation':          'test42',
          worker:                             {
            'doc5_8_012_furigana':                        ['test12'],
            'doc5_8_013_worker_name':                     ['test13'],
            'doc5_8_014_skilled_person_id':               ['test14'],
            'doc5_8_015_occupation':                      ['test15'],
            'doc5_8_016_symbol':                          ['test16'],
            'doc5_8_017_employment_date':                 ['2022-01-01'],
            'doc5_8_018_years_of_experience':             ['18'],
            'doc5_8_019_birthday':                        ['2022-01-01'],
            'doc5_8_020_age':                             ['20'],
            'doc5_8_021_address':                         ['test21'],
            'doc5_8_022_family_contact_address':          ['test22'],
            'doc5_8_023_telephone_number':                ['test23'],
            'doc5_8_024_family_telephone_number':         ['test24'],
            'doc5_8_025_health_check_date':               ['2022-01-01'],
            'doc5_8_026_maximum_blood_pressure':          ['26'],
            'doc5_8_027_minimum_blood_pressure':          ['27'],
            'doc5_8_028_blood_type':                      ['A'],
            'doc5_8_029_special_health_examination_date': ['2022-01-01'],
            'doc5_8_030_special_health_check_type':       ['test30'],
            'doc5_8_031_health_insurance':                ['test31'],
            'doc5_8_032_pension_insurance':               ['test32'],
            'doc5_8_033_employment_insurance_number':     ['test33'],
            'doc5_8_034_severance_pay':                   ['test34'],
            'doc5_8_035_severance_pay_businesses':        ['test35'],
            'doc5_8_036_special_education':               ['test36'],
            'doc5_8_037_skill_training':                  ['test37'],
            'doc5_8_038_licence':                         ['test38'],
            'doc5_8_039_beginning':                       ['2022-01-01'],
            'doc5_8_040_new_education':                   ['2022-01-01'],
            'doc5_8_041_notebook':                        ['test41']
          }
        }
      end
    end
  end
end
