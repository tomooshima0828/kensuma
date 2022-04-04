Business.all.each do |business|
  3.times do |n|
    Car.seed(:id,
      {
        business_id:         business.id,
        car_insurance_company_id: 1,
        owner_name:                "車両所有者#{n+1}",
        safety_manager:           "安全運転管理者#{n+1}",
        vehicle_model:             "車両型式#{n+1}",
        vehicle_number:          "12-3#{n+1}",
        vehicle_inspection_start_on:     '2020-01-01',
        vehicle_inspection_end_on:      '2025-01-01',
        liability_securities_number: "12345#{n+1}",
        liability_insurance_start_on:        '2000-01-01',
        liability_insurance_end_on:     '2030-01-01'
      }
    )
  end
end
