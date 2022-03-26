module Users
  class TableOfContentsDocumentsController < Users::Base
    include DocumentsConcern

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

    # def edit
    #   @second_document = @document.second_document
    # end

    # def update
    #   redirect_to users_document_table_of_contents_documents_path
    # end

    private

    def table_of_contents_document_params
      params.require(:table_of_contents_document).permit(:details)
    end
  end
end
