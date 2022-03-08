module Users
  class SubRequestOrdersController < Users::Base
    before_action :set_request_order

    def index; end

    def new
      @sub_request_order = @request_order.order.request_orders.build
      @businesses = Business.where.not(id: current_business)
    end

    def create
      # params[:business_ids]の最初の空欄部を削除
      params[:business_ids].delete('')
      if params[:business_ids].present?
        save_count = 0
        no_save_count = 0
        params[:business_ids].each do |business_id|
          sub_request_order = @request_order.order.request_orders.build(business_id: business_id.to_i, parent_id: @request_order.id)
          # もしsub_request_orderが何らかの理由でsaveできていなかった場合の処理。
          if sub_request_order.save
            save_count += 1
          else
            no_save_count += 1
          end
        end
        flash[:success] = "下請けへの発注依頼を#{save_count}件作成しました"
        # もしsub_request_orderが何らかの理由でsaveできていなかった場合のフラッシュメッセージ
        flash[:danger] = "下請けへの発注依頼作成に#{no_save_count}件失敗しました" if no_save_count >= 1
        redirect_to users_request_order_url(@request_order)
      else
        flash[:danger] = '下請けへの発注依頼に失敗しました。'
        redirect_to new_users_request_order_sub_request_order_url(@request_order)
      end
    end

    def update; end

    private

    def set_request_order
      @request_order = current_business.request_orders.find_by(uuid: params[:request_order_uuid])
    end
  end
end
