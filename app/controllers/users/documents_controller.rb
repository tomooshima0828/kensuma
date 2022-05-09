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
        document.update(second_document_params)
      when 'doc_8th'
        document.update(eighth_document_params)
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

    # 通勤用車両届
    def eighth_document_params
      params.require(:document).permit.merge(
        content: {
          prime_contractor_confirmation:                        params[:document][:content][0],  # 12-001 元請会社の確認欄
          submitted_on:                                         params[:document][:content][1],  # 12-002 提出日（西暦）
          construction_or_commute1:                             params[:document][:content][2],  # 12-003 工事用 or 通勤用
          business_name:                                        params[:document][:content][3],  # 12-004 事業所名
          business_director:                                    params[:document][:content][4],  # 12-005 現場代理人
          prime_contractor_name:                                params[:document][:content][5],  # 12-006 一次会社名
          subcontructor_number:                                 params[:document][:content][6],  # 12-007 ◯次
          subcontractor_name:                                   params[:document][:content][7],  # 12-008 自社の会社名
          site_supervisor:                                      params[:document][:content][8],  # 12-009 各会社の現場代理人
          seal:                                                 params[:document][:content][9],  # 12-010 印鑑
          construction_or_commute2:                             params[:document][:content][10], # 12-011 工事用 or 通勤用
          start_of_use:                                         params[:document][:content][11], # 12-012 各車両の使用期間・始期（西暦）
          end_of_use:                                           params[:document][:content][12], # 12-013 各車両の使用期間・終期（西暦）
          vehicle_owner:                                        params[:document][:content][13], # 12-014 各車両の「車両所有者名」
          safety_drive_administrator:                           params[:document][:content][14], # 12-015 各車両の「安全運転管理者」
          vehicle_type:                                         params[:document][:content][15], # 12-016 各車両の「車両型式」
          vehicle_number:                                       params[:document][:content][16], # 12-017 各車両の「車両番号」
          start_of_valid_vehicle_inspection:                    params[:document][:content][17], # 12-018 各車両の「車検期間・始期（西暦）」
          end_of_valid_vehicle_inspection:                      params[:document][:content][18], # 12-019 各車両の「車検期間・終期（西暦）」
          vehicle_operator_name:                                params[:document][:content][19], # 12-020 作業員情報の「氏名」
          vehicle_operator_birth_date:                          params[:document][:content][20], # 12-021 作業員情報の「生年月日」
          vehicle_operator_address:                             params[:document][:content][21], # 12-022 作業員情報の「住所」
          vehicle_operator_driving_license_type:                params[:document][:content][22], # 12-023 作業員情報の「自動車運転免許の種類」
          vehicle_operator_driving_license_number:              params[:document][:content][23], # 12-024 作業員情報の「自動車運転免許の番号」
          vehicle_liability_insurance_company_name:             params[:document][:content][24], # 12-025 各車両の「自賠責保険会社名」
          vehicle_liability_insurance_number:                   params[:document][:content][25], # 12-026 各車両の「自賠責保険の証券番号」
          vehicle_liability_insurance_start_of_validity:        params[:document][:content][26], # 12-027 各車両の「自賠責保険期間・始期（西暦）」
          vehicle_liability_insurance_end_of_validity:          params[:document][:content][27], # 12-028 各車両の「自賠責保険期間・終期（西暦）」
          voluntary_insurance_company_name:                     params[:document][:content][28], # 12-029 各車両の「任意保険会社名」
          voluntary_insurance_number:                           params[:document][:content][29], # 12-030 各車両の「任意保険の証券番号」
          voluntary_insurance_bodily_injury_liability_amount:   params[:document][:content][30], # 12-031 各車両の「任意保険の対人」
          voluntary_insurance_property_damage_liability_amount: params[:document][:content][31], # 12-032 各車両の「任意保険の対物」
          voluntary_insurance_start_of_validity:                params[:document][:content][32], # 12-033 各車両の「任意保険期間・始期（西暦）」
          voluntary_insurance_end_of_validity:                  params[:document][:content][33], # 12-034 各車両の「任意保険期間・終期（西暦）」
          departing_from:                                       params[:document][:content][34], # 12-035 各車両の「運行経路(自)」
          routing_point1:                                       params[:document][:content][35], # 12-036 各車両の「運行経路の経由地1」
          routing_point2:                                       params[:document][:content][36], # 12-037 各車両の「運行経路の経由地2」
          arriving_at:                                          params[:document][:content][37]  # 12-038 各車両の「目的地（至）」
        })
    end
  end
end
