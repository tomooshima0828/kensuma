module DocumentsConcern
  extend ActiveSupport::Concern

  # 書類関連の共通メソッド
  def set_documents
    @documents = Document.all.order(id: :asc)
  end
end
