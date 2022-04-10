Worker.all.each do |worker|
  3.times do |n|
    WorkerLicense.seed(:id,
      {
        worker_id:         worker.id,
        license_id:        n+1,
        got_on:             '2022-02-12'
      }
    )
  end
end
