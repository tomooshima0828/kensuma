# frozen_string_literal: true

module Users
  class Base < ApplicationController
    before_action :authenticate_user!
    layout 'users'

    # 事業所が登録してあればダッシュボードへ
    def business_present_access
      business = Business.find_by(user_id: current_user.id)
      if business.present?
        flash[:danger] = '事業所はすでに登録済みです'
        redirect_to users_dash_boards_path
      end
    end

    # 事業所が登録してなければ事業所登録画面へ
    def business_nil_access
      business = Business.find_by(user_id: current_user.id)
      if business.nil?
        flash[:danger] = '事業所を登録して下さい'
        redirect_to new_users_business_path
      end
    end
  end
end
