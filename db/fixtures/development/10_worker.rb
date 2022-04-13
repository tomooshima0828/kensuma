Business.all.each do |business|
  3.times do |n|
    Worker.seed(:id,
      {
        id: n+1,
        business_id:         business.id,
        name:                "テスト作業員#{n+1}",
        name_kana:           "テストサギョウイン#{n+1}",
        country:             "日本",
        my_address:          "東京都サギョウ区1-2-#{n+1}",
        my_phone_number:     '01234567898',
        family_address:      "千葉県サギョウ区1-2-#{n+1}",
        family_phone_number: '01234567898',
        birth_day_on:        '2000-01-01',
        abo_blood_type:      0,
        rh_blood_type:       0,
        hiring_on:           '2022-01-01',
        experience_term_before_hiring: 1,
        blank_term:          1
      }
    )
  end
end
