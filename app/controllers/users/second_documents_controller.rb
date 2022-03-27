module Users
  class SecondDocumentsController < Users::Base
    layout 'documents'
    before_action :set_documents
    before_action :set_document

    def show
      @second_document = @document.second_document
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

    def edit
      @details = @document.second_document
      @second_document = @document.second_document
      @aaa = @document.second_document
    end

    def update
      @second_document = @document.second_document
      if @second_document.update(second_document_params)
        flash[:success] = '更新に成功しました'
        redirect_to users_document_second_documents_path
      else
        flash[:danger] = '更新に失敗しました'
        render :edit
      end
    end

    private

    def set_documents
      @documents = Document.all.order(id: :asc)
    end

    def set_document
      @document = Document.find_by(uuid: params[:document_uuid])
    end

    def second_document_params
      params.require(:second_document).permit(details: [])
    end
  end
end
