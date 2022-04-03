module Users
  class SecondDocumentsController < Users::Base
    include DocumentsConcern

    layout 'documents'
    before_action :set_document
    before_action :set_second_document, only: %i[show edit update]
    before_action :set_second_document_contents, only: %i[show edit]

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
        redirect_to users_document_second_documents_path
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

    def set_second_document_contents
      @second_submitted_on = JSON.parse(@second_document.content.to_json)[0]['submitted_on']
      @second_prime_contractor_name = JSON.parse(@second_document.content.to_json)[1]['prime_contractor_name']
      @second_site_name = JSON.parse(@second_document.content.to_json)[2]['site_name']
      @second_business_name = JSON.parse(@second_document.content.to_json)[3]['business_name']
      @second_orderer_name = JSON.parse(@second_document.content.to_json)[4]['orderer_name']
      @second_construction_name = JSON.parse(@second_document.content.to_json)[5]['construction_name']
      @second_supervisor_name = JSON.parse(@second_document.content.to_json)[6]['supervisor_name']
      @second_apply = JSON.parse(@second_document.content.to_json)[7]['apply']
      @second_submission_destination = JSON.parse(@second_document.content.to_json)[8]['submission_destination']
    end

    def second_document_params
      params.require(:document).permit.merge(
        content: [
          { id: 1, submitted_on: params[:document][:content][0] },
          { id: 2, prime_contractor_name: params[:document][:content][1] },
          { id: 3, site_name: params[:document][:content][2] },
          { id: 4, business_name: params[:document][:content][3] },
          { id: 5, orderer_name: params[:document][:content][4] },
          { id: 6, construction_name: params[:document][:content][5] },
          { id: 7, supervisor_name: params[:document][:content][6] },
          { id: 8, apply: params[:document][:content][7] },
          { id: 9, submission_destination: params[:document][:content][8] }
        ]
      )
    end
  end
end
