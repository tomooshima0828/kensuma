module Users
  class TableOfContentsDocumentsController < Users::Base
    include DocumentsConcern

    layout 'documents'
    # before_action :set_documents
    before_action :set_document

    # サイドバーリンク用
    before_action :set_cover_document_uuid
    before_action :set_table_of_contents_document_uuid
    before_action :set_second_document_uuid

    def show
      @document = Document.find_by(uuid: params[:document_uuid])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: '目次・チェック欄',
            layout: 'pdf',
            encording: 'UTF-8',
            page_size: 'A4'
        end
      end
    end

    private

    # def set_documents
    #   @documents = Document.all.order(id: :asc)
    # end

    def set_document
      @document = current_business.documents.find_by(uuid: params[:document_uuid])
    end

    def table_of_contents_document_params
      params.require(:table_of_contents_document).permit(:details)
    end
  end
end
