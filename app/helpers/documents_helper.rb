module DocumentsHelper
  def worker_number(worker)
    worker[1] + 1 unless worker.nil?
  end

  # contentの作業員jsonデータ workerモデルのカラム表示
  def worker_column(column, worker)
    # @document.content['worker'][column][worker[1]] unless worker.nil?
    JSON.parse(worker[0])[column] unless worker.nil?
  end

  # contentの作業員jsonデータ worker_medicalモデルのカラム表示
  def worker_attribute_column(model, column, worker)
    # JSON.parse(w1[0])["worker_medical"]["special_med_exam_on"] unless w1.nil?
    JSON.parse(worker[0])[model][column] unless worker.nil?
  end

  def worker_attributes_column(model, column, worker)
    # JSON.parse(w1[0])["worker_skill_trainings"].map {|value|value["skill_training_id"]}
    JSON.parse(worker[0])[model].map { |value| value[column] } unless worker.nil?
  end
end
