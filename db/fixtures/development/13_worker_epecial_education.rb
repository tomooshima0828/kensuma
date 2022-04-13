Worker.all.each do |worker|
  3.times do |n|
    WorkerSpecialEducation.seed(:id,
      {
        id: n+1,
        worker_id:         worker.id,
        special_education_id:        n+1,
        got_on:             '2022-02-12'
      }
    )
  end
end
