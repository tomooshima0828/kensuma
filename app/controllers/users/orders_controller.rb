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
      @order = current_business.orders.build(order_params)
      request_order = @order.request_orders.build(business: current_business)
      # テスト用documentデフォルト値 ==================
      request_order.documents.build(
        document_type: 0,
        created_on:    Date.current,
        submitted_on:  Date.current,
        content:       ['テスト事業所名', Date.current],
        business:      current_business
      )

      request_order.documents.build(
        document_type: 1,
        created_on:    Date.current,
        submitted_on:  Date.current,
        content:       [],
        business:      current_business
      )

      request_order.documents.build(
        document_type: 2,
        created_on:    Date.current,
        submitted_on:  Date.current,
        content:       [],
        business:      current_business
      )
      # =============================================
      if @order.save
        redirect_to users_order_url(@order)
      else
        render :new
      end
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
