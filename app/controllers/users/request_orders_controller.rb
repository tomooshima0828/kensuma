module Users
  class RequestOrdersController < Users::Base
    def index
      @request_orders = current_business.request_orders
    end

    def show
      @request_order = current_business.request_orders.find_by(uuid: params[:uuid])
      @sub_request_orders = @request_order.children
    end

    def submit
      @request_order = current_business.request_orders.find_by(uuid: params[:uuid])
      @request_order.submitted!
      flash[:success] = '発注依頼を提出済にしました'
      redirect_to users_request_order_path(@request_order)
    end
  end
end
