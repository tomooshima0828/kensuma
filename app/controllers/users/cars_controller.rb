module Users
  class CarsController < Users::Base
    before_action :set_car, except: %i[new create]

    def index
    end

    def show
    end

    def new
      @car = Car.new
    end

    def create
      @car = current_user.cars.build(car_params)
      if @car.save
        redirect_to users_car_url(@car)
      else
        render :new
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    def update_images
      # 残りimageを定義
      remain_images = @car.images
      # imageを削除する
      deleted_image = remain_images.delete_at(params[:index].to_i)
      deleted_image.try(:remove!)
      # 削除した後のimageをupdateする
      @car.update!(images: remain_images)
      flash[:danger] = '削除しました'
      redirect_to edit_users_car_url
    end

    private

    def set_car
      @car = current_user.cars
    end

    def car_params
      params.require(:car).permit(:owner_name, :safety_manager,
        :vehicle_model, :vehicle_number, :vehicle_inspection_start_on, :vehicle_inspection_end_on,
        :liability_securities_number, :liability_insurance_start_on, :liability_insurance_end_on,
        :voluntary_securities_number, :voluntary_insurance_start_on, :voluntary_insurance_end_on,
        { images: [] }, :user_id)
    end
  end
end
