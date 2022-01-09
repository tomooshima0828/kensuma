module Users
  class BusinessesController < Users::Base
    def new
      @user = current_user
      @business = @user.businesses.new( uuid: "test", name: "test", name_kana: "テスト", branch_name: "test", representative_name: "test", 
                                email: "test@email.com", address: "test", post_code: "0123456", phone_number: "01234567898", carrier_up_id: "test", business_type: 0)
    end

    def create
    end

    def edit
      @business = Business.find(params[:id])
    end

    def update
    end

    def show
    end
  end
end
