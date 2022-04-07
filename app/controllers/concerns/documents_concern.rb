module DocumentsConcern
  extend ActiveSupport::Concern

  def set_documents
    @documents = current_business.request_orders.find_by(uuid: params[:request_order_uuid]).documents.order(id: :asc)
  end
end
