module Users
  class RequestOrdersController < Users::Base
    def index
      @request_orders = RequestOrder.where(business: current_business)
    end

    def show
      @request_order = current_business.request_orders.find(params[:id])
    end
  end
end
