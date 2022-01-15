# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when User
      business = Business.find_by(user_id: resource)
      if business.present?
        users_dash_boards_path
      else
        new_users_businesses_path
      end
    when Admin
      admin_dashboard_path
    when Manager
      managers_dash_boards_path
    end
  end

  def configure_permitted_parameters
    added_attrs = %i[email name password password_confirmation]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

  # 事業所が登録してあればダッシュボードに
  def business_no_access
    if @business.nil?
      flash[:danger] = "事業所はすでに登録済みです"
      redirect_to users_dash_boards_path
    end
  end

end
