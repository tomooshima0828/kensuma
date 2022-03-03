require 'rails_helper'

RSpec.describe "RequestOrders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/request_orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/request_orders/show"
      expect(response).to have_http_status(:success)
    end
  end

end
