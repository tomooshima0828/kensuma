module Users
  class BusinessesController < Users::Base
    def new
      @business = Business.new( uuid: "test", name: "test", name_kana: "テスト", branch_name: "test", representative_name: "test", email: "test@email.com", 
                                address: "test", post_code: "0123456", phone_number: "01234567898", carrier_up_id: "test", business_type: 0, user_id: current_user.id)
    end

    def create
      @business = Business.new(business_params)
      if @business.save
        binding.pry
        redirect_to users_businesses_path
      else
        render :new
      end
    end

    def edit
      @business =  Business.find_by(user_id: current_user.id)
    end

    def update
      @business =  Business.find_by(user_id: current_user.id)
      if @business.update(business_params)
        flash[:success] = "更新しました"
        redirect_to users_businesses_path
      else
        render 'edit'
      end
    end

    def show
      @business =  Business.find_by(user_id: current_user.id)
    end

    private

      def business_params
        params.require(:business).permit(:uuid, :name, :name_kana, :branch_name, :representative_name, :email, :address, :post_code, :phone_number, :carrier_up_id, :business_type, :stamp_images, :user_id)
      end
  end
end
