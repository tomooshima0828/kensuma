# frozen_string_literal: true

module Users
  class Base < ApplicationController
    before_action :authenticate_user!
    layout 'users'

    def check_business_exist
      business = current_user.business
      if business.present?
        redirect_to users_dash_boards_path, flash: { danger: '事業所はすでに登録済みです' }
      else
        redirect_to new_users_business_path, flash: { danger: '事業所を登録して下さい' }
      end
    end
  end
end
