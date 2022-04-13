Worker.all.each do |worker|
  3.times do |n|
    WorkerSkillTraining.seed(:id,
      {
        id: n+1,
        worker_id:         worker.id,
        skill_training_id:        n+1,
        got_on:             '2022-02-12'
      }
    )
  end
end
