module DocumentsConcern
  extend ActiveSupport::Concern

  def set_documents
    @documents = current_business.documents.order(id: :asc)
  end

  # サイドバー表紙リンク用
  def set_cover_document_uuid
    @cover_document_uuid = current_business.documents.where(document_type: 0, request_order: @document.request_order.id).map(&:uuid)
  end

  # サイドバー目次リンク用
  def set_table_of_contents_document_uuid
    @table_of_contents_document_uuid = current_business.documents.where(document_type: 1, request_order: @document.request_order.id).map(&:uuid)
  end

  # サイドバーdoc_2ndリンク用
  def set_second_document_uuid
    @second_document_uuid = current_business.documents.where(document_type: 2, request_order: @document.request_order.id).map(&:uuid)
  end
end
