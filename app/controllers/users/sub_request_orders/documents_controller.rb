module Users::SubRequestOrders
  class DocumentsController < Users::Base
    layout 'documents'
    before_action :set_documents # サイドバーに常時表示させるために必要
    before_action :set_document, except: :index # オブジェクトが1つも無い場合、indexで呼び出さないようにする

    def index
      request_order = current_business.request_orders.find_by!(uuid: params[:request_order_uuid])
      sub_request_order = RequestOrder.find_by!(uuid: params[:sub_request_order_uuid])
      unless sub_request_order.child_of?(request_order)
        raise "だめ"
      end
      binding.irb
      @documents = sub_request_order.documents
      render 'users/documents/index'
    end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          case @document.document_type
          when 'cover_document', 'table_of_contents_document', 'doc_2nd', 'doc_8th'
            render pdf: '書類',
              layout: 'pdf',
              encording: 'UTF-8',
              page_size: 'A4'
          when 'doc_5th'
            render pdf: '書類',
              layout: 'pdf',
              encording: 'UTF-8',
              page_size: 'A4',
              margin: { top: 0 },
              orientation: 'Landscape'
          end
        end
      end
    end

    private

    def set_documents
      @documents = current_business.request_orders.find_by(uuid: params[:request_order_uuid]).documents.order(id: :asc)
    end

    def set_document
      @document = current_business.request_orders.find_by(uuid: params[:request_order_uuid]).documents.find_by(uuid: params[:uuid])
    end
  end
end
