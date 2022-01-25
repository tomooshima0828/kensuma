module Users
  class GeneralUsersController < Users::Base
    def index
      @admin = current_user
      @general_users = User.where(admin_user_id: @admin)
    end

    def new
      @admin = current_user
      @general_user = @admin.general_users.new
    end

    def create
      @admin = current_user
      @general_user = @admin.general_users.new(general_user_params)
      if @general_user.save
        redirect_to users_general_users_url
      else
        render :new
      end
    end

    def edit; end

    def update; end

    def show; end

    def destroy; end

    private

    def general_user_params
      params.require(:user).permit(:name, :email, :age, :gender, :password)
    end
  end
end
