module Users
  class TableOfContentsDocumentsController < Users::Base
    layout 'documents'
    before_action :set_documents

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

    def set_documents
      @documents = Document.all.order(id: :asc)
    end

    def table_of_contents_document_params
      params.require(:table_of_contents_document).permit(:details)
    end
  end
end
