module Users
  class RequestOrdersController < Users::Base
    def index
      @request_orders = current_business.request_orders
    end

    def show
      @request_order = current_business.request_orders.find_by(uuid: params[:uuid])
      @sub_request_orders = @request_order.order.request_orders.where(parent_id: @request_order.id).where.not(business_id: @request_order.business_id)
    end
  end
end
