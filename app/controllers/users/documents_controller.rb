module Users
  class DocumentsController < Users::Base
    layout 'documents'
    before_action :set_documents # サイドバーに常時表示させるために必要
    before_action :set_document, except: :index # オブジェクトが1つも無い場合、indexで呼び出さないようにする

    def index; end

    def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: '表紙',
            layout: 'pdf',
            encording: 'UTF-8',
            page_size: 'A4'
        end
      end
    end

    def edit; end

    def update
      if update_document(@document)
        flash[:success] = '更新に成功しました'
        redirect_to users_request_order_document_url
      else
        flash[:danger] = '更新に失敗しました'
        render :edit
      end
    end

    private

    def set_documents
      @documents = current_business.request_orders.find_by(uuid: params[:request_order_uuid]).documents.order(id: :asc)
    end

    def set_document
      @document = current_business.request_orders.find_by(uuid: params[:request_order_uuid]).documents.find_by(uuid: params[:uuid])
    end

    # 更新書類の判定
    def update_document(document)
      case document.document_type
      when 'cover_document'
        document.update(cover_params)
      when 'doc_2nd'
        document.update(doc_2nd_params)
      when 'doc_5th'
        document.update(doc_5th_params)
      end
    end

    # 表紙
    def cover_params
      params.require(:document).permit.merge(
        content: {
          business_name: params[:document][:content][0],
          submitted_on:  params[:document][:content][1]
        })
    end

    # 施工体制台帳作成建設工事の通知
    def doc_2nd_params
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

    # 作業員名簿
    def doc_5th_params
      params.require(:document).permit.merge(
        content: {
          business_name:                   params[:document][:content][0],  # 8-001
          site_id:                         params[:document][:content][1],  # 8-002
          site_agent:                      params[:document][:content][2],  # 8-003
          created_date:                    params[:document][:content][3],  # 8-004
          primary_business_name:           params[:document][:content][4],  # 8-005
          primary_business_id:             params[:document][:content][5],  # 8-006
          hierarchy:                       params[:document][:content][6],  # 8-007
          my_business_name:                params[:document][:content][7],  # 8-009
          my_business_id:                  params[:document][:content][8],  # 8-010
          submitted_on:                    params[:document][:content][9],  # 8-011
          furigana:                        params[:document][:content][10], # 8-012
          worker_name:                     params[:document][:content][11], # 8-013
          skilled_person_id:               params[:document][:content][12], # 8-014
          occupation:                      params[:document][:content][13], # 8-015
          symbol:                          params[:document][:content][14], # 8-016
          employment_date:                 params[:document][:content][15], # 8-017
          years_of_experience:             params[:document][:content][16], # 8-018
          birthday:                        params[:document][:content][17], # 8-019
          age:                             params[:document][:content][18], # 8-020
          address:                         params[:document][:content][19], # 8-021
          family_contact_address:          params[:document][:content][20], # 8-022
          telephone_number:                params[:document][:content][21], # 8-023
          family_telephone_number:         params[:document][:content][22], # 8-024
          health_check_date:               params[:document][:content][23], # 8-025
          maximum_blood_pressure:          params[:document][:content][24], # 8-026
          minimum_blood_pressure:          params[:document][:content][25], # 8-027
          blood_type:                      params[:document][:content][26], # 8-028
          special_health_examination_date: params[:document][:content][27], # 8-029
          special_health_check_type:       params[:document][:content][28], # 8-030
          health_insurance:                params[:document][:content][29], # 8-031
          pension_insurance:               params[:document][:content][30], # 8-032
          employment_insurance_number:     params[:document][:content][31], # 8-033
          severance_pay:                   params[:document][:content][32], # 8-034
          severance_pay_businesses:        params[:document][:content][33], # 8-035
          special_education:               params[:document][:content][34], # 8-036
          skill_training:                  params[:document][:content][35], # 8-037
          licence:                         params[:document][:content][36], # 8-038
          beginning:                       params[:document][:content][37], # 8-039
          new_education:                   params[:document][:content][38], # 8-040
          notebook:                        params[:document][:content][39]  # 8-041
        }
      )
    end
  end
end
