module DocumentsHelper
  def worker_number(worker)
    worker[1] + 1 unless worker.nil?
  end

  def worker_column(column, worker)
    # @document.content['worker'][column][worker[1]] unless worker.nil?
    JSON.parse(worker[0])[column] unless worker.nil?
  end
end
