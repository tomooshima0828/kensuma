Car.all.each do |car|
  2.times do |n|
    CarVoluntaryInsurance.seed(:id,
      {
        car_voluntary_id:         car.id,
        company_voluntary_id:     n+1,
        personal_insurance:       2,
        objective_insurance:      3,
        voluntary_securities_number:    "67890#{n+1}",
        voluntary_insurance_start_on:   '2021-02-12',
        voluntary_insurance_end_on:      '2022-02-12'
      }
    )
  end
end
