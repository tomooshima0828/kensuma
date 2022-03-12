module Users
  class DocumentsController < Users::Base
    layout "documents"
    before_action :set_document, only: %i[show edit]

    def index
      @documents = Document.all
      create_cover_documents
    end

    def show
    end

    def edit
    end

    private

    def set_document
      @document = Document.find_by(uuid: params[:uuid])
    end

    def document_params
      params.require(:document).permit(:type, :created_on, :submitted_on)
    end

    # cover_documentが未作成の場合に作成する
    def create_cover_documents
      @documents.each do |document|
        if document.cover_document.blank?
          cover_document = document.build_cover_document
          cover_document.save!
        end
      end
    end
  end
end
