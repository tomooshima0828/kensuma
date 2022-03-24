module Users
  class SecondDocumentsController < Users::Base
    include DocumentsConcern

    layout 'documents'
    before_action :set_documents

    def show
      @document = Document.find_by(uuid: params[:document_uuid])
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: '施工体制台帳作成建設工事の通知',
            layout: 'pdf',
            encording: 'UTF-8',
            page_size: 'A4'
        end
      end
    end
  end
end
