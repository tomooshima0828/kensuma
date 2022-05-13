json.worker do
  json.merge! @worker.attributes

  json.licenses @worker.licenses do |license|
    json.merge! license.attributes
  end

  json.skill_trainings @worker.skill_trainings do |skill_training|
    json.merge! skill_training.attributes
  end

  json.special_educations @worker.special_educations do |special_education|
    json.merge! special_education.attributes
  end

  json.worker_medical do
    json.merge! @worker.worker_medical.attributes

    json.special_med_exams @worker.worker_medical.special_med_exams do |special_med_exam|
      json.merge! special_med_exam.attributes
    end
  end
end
