module Users
  class SecondDocumentsController < Users::Base
    include DocumentsConcern

    layout 'documents'
    before_action :set_documents
    before_action :set_document
    before_action :set_second_document, only: %i[show edit update]

    # サイドバーリンク用
    before_action :set_cover_document_uuid
    before_action :set_table_of_contents_document_uuid
    before_action :set_second_document_uuid

    def show
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

    def edit; end

    def update
      if @second_document.update(second_document_params)
        flash[:success] = '更新に成功しました'
        redirect_to users_request_order_document_second_path
      else
        flash[:danger] = '更新に失敗しました'
        render :edit
      end
    end

    private

    def set_document
      @document = current_business.documents.find_by(uuid: params[:document_uuid])
    end

    def set_second_document
      @second_document = current_business.documents.document_type_second.find_by(uuid: params[:document_uuid])
    end

    def second_document_params
      params.require(:document).permit.merge(
        content: {
          submitted_on:           params[:document][:content][0],
          prime_contractor_name:  params[:document][:content][1],
          site_name:              params[:document][:content][2],
          business_name:          params[:document][:content][3],
          orderer_name:           params[:document][:content][4],
          construction_name:      params[:document][:content][5],
          supervisor_name:        params[:document][:content][6],
          apply:                  params[:document][:content][7],
          submission_destination: params[:document][:content][8]
        }
      )
    end
  end
end
