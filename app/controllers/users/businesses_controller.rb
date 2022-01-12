module Users
  class BusinessesController < Users::Base

    before_action :set_business, except: [:new, :create]

    def new
      @business = Business.new( uuid: "test", name: "test", name_kana: "テスト", branch_name: "test", representative_name: "test", email: "test@email.com", 
                                address: "test", post_code: "0123456", phone_number: "01234567898", carrier_up_id: "test", business_type: 0, user_id: current_user.id)
    end

    def create
      @business = Business.new(business_params)
      if @business.save
        redirect_to users_businesses_path
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @business.update(business_params)
        flash[:success] = "更新しました"
        redirect_to users_businesses_path
      else
        render 'edit'
      end
    end

    def show
    end
    
    def stamp_images_create
      @business.remove_stamp_images!
      @business.save
      redirect_to users_business_path
    end


    def stamp_images_delete
      binding.pry
      remain_stamp_images = @business.stamp_images
      binding.pry
        if index == 0 && @business.stamp_images.size == 1
          binding.pry
          @business.remove_stamp_images!
          binding.pry
        else
          binding.pry
          deleted_stamp_image = remain_stamp_images.delete_at(index)
          binding.pry
          deleted_stamp_image.try(:remove!)
          binding.pry
          @business.stamp_images = remain_stamp_images
          binding.pry
        end
        binding.pry
      flash[:danger] = "削除しました"
      redirect_to edit_users_businesses_path
    end

    private

      def set_business
        @business =  Business.find_by(user_id: current_user.id)
      end

      def business_params
        params.require(:business).permit(:uuid, :name, :name_kana, :branch_name, :representative_name, :email, :address, :post_code, :phone_number, :carrier_up_id, :business_type, { stamp_images: [] }, { stamp_images_cache: [] }, { remove_stamp_images: [] }, :user_id)
      end
      
  end
end
