module DocumentsHelper
  def worker_number(worker)
    worker[1] + 1 if worker != nil
  end

  def worker_column(column, worker)
    @document.content["worker"][column][worker[1]] if worker != nil
  end
end
