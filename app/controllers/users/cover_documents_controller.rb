module Users
  class CoverDocumentsController < Users::Base
    layout 'documents'

    def update
      document = Document.find_by(uuid: params[:document_uuid])
      cover_document = document.cover_document
      if cover_document.update(cover_document_params)
        flash[:success] = "書類#{cover_document.document.id}の更新に成功しました"
      else
        flash[:danger] = "書類#{cover_document.document.id}の更新に失敗しました"
      end
      redirect_to users_document_url(document)
    end

    private

    def cover_document_params
      params.require(:cover_document).permit(:business_name, :submitted_on)
    end
  end
end
