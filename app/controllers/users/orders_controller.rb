module Users
  class OrdersController < Users::Base
    before_action :set_order, except: %i[index new create]

    def index
      @orders = current_business.orders
    end

    def show; end

    def new
      @order = current_business.orders.new(
        # テスト用デフォルト値 ==========================
        site_name:  current_business.name,
        order_name: current_user.name
        # order_post_code: current_business.post_code,
        # order_address:   current_business.address
        # =============================================
      )
    end

    def create
      ActiveRecord::Base.transaction do
        @order = current_business.orders.build(order_params)
        request_order = @order.request_orders.build(business: current_business)
        # 表紙
        request_order.documents.build(
          document_type: 0,
          created_on:    Date.current,
          submitted_on:  Date.current,
          content:       {
            'business_name': '', # 1-1
            'submitted_on':  ''  # 1-2
          },
          business:      current_business
        )

        # 目次
        request_order.documents.build(
          document_type: 1,
          created_on:    Date.current,
          submitted_on:  Date.current,
          content:       {},
          business:      current_business
        )

        # 施工体制台帳作成建設工事の通知
        request_order.documents.build(
          document_type: 2,
          created_on:    Date.current,
          submitted_on:  Date.current,
          content:       {
            'submitted_on':           '', # 3-1
            'prime_contractor_name':  '', # 3-2
            'site_name':              '', # 3-3
            'business_name':          '', # 3-4
            'orderer_name':           '', # 3-5
            'construction_name':      '', # 3-6
            'supervisor_name':        '', # 3-7
            'apply':                  '', # 3-8
            'submission_destination': ''  # 3-9
          },
          business:      current_business
        )

        # 作業員名簿
        request_order.documents.build(
          document_type: 5,
          created_on:    Date.current,
          submitted_on:  Date.current,
          content:       { 
            # 'business_name':                   '', # 8-001
            # 'site_id':                         '', # 8-002
            # 'site_agent':                      '', # 8-003
            # 'created_date':                    '', # 8-004
            # 'primary_business_name':           '', # 8-005
            # 'primary_business_id':             '', # 8-006
            # 'hierarchy':                       '', # 8-007
            # 'my_business_name':                '', # 8-009
            # 'my_business_id':                  '', # 8-010
            # 'submitted_on':                    '', # 8-011
            # 'furigana':                        '', # 8-012
            # 'worker_name':                     '', # 8-013
            # 'skilled_person_id':               '', # 8-014
            # 'occupation':                      '', # 8-015
            # 'symbol':                          '', # 8-016
            # 'employment_date':                 '', # 8-017
            # 'years_of_experience':             '', # 8-018
            # 'birthday':                        '', # 8-019
            # 'age':                             '', # 8-020
            # 'address':                         '', # 8-021
            # 'family_contact_address':          '', # 8-022
            # 'telephone_number':                '', # 8-023
            # 'family_telephone_number':         '', # 8-024
            # 'health_check_date':               '', # 8-025
            # 'maximum_blood_pressure':          '', # 8-026
            # 'minimum_blood_pressure':          '', # 8-027
            # 'blood_type':                      '', # 8-028
            # 'special_health_examination_date': '', # 8-029
            # 'special_health_check_type':       '', # 8-030
            # 'health_insurance':                '', # 8-031
            # 'pension_insurance':               '', # 8-032
            # 'employment_insurance_number':     '', # 8-033
            # 'severance_pay':                   '', # 8-034
            # 'severance_pay_businesses':        '', # 8-035
            # 'special_education':               '', # 8-036
            # 'skill_training':                  '', # 8-037
            # 'licence':                         '', # 8-038
            # 'beginning':                       '', # 8-039
            # 'new_education':                   '', # 8-040
            # 'notebook':                        ''  # 8-041
          },
          business:      current_business
        )


        if @order.save!
          redirect_to users_order_url(@order)
        end
      end
    rescue ActiveRecord::RecordInvalid
      flash[:danger] = '登録に失敗しました。再度作成してください。'
      redirect_to new_users_order_path
    end

    def edit; end

    def update
      if @order.update(order_params)
        flash[:success] = '更新しました'
        redirect_to users_order_url
      else
        render :edit
      end
    end

    def destroy
      @order.destroy!
      flash[:danger] = "#{@order.site_uu_id}を削除しました"
      redirect_to users_orders_url
    end

    private

    def set_order
      @order = current_business.orders.find_by(site_uu_id: params[:site_uu_id])
    end

    def order_params
      params.require(:order).permit(:status, :site_name, :order_name, :order_post_code, :order_address)
    end
  end
end
