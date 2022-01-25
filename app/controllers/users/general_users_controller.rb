module Users
  class GeneralUsersController < Users::Base
    before_action :set_general_user, except: %i[index new create]

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

    def update
      if @general_user.update(general_user_params)
        flash[:success] = '更新しました'
        redirect_to users_general_user_url
      else
        render 'edit'
      end
    end

    def show; end

    def destroy; end

    private

    def set_general_user
      @admin = current_user
      @general_user = @admin.general_users.find(params[:id])
    end

    def general_user_params
      params.require(:user).permit(:name, :email, :age, :gender, :password)
    end
  end
end
