class ApplicationController < ActionController::Base
    before_action :update_allowed_parameters, if: :devise_controller?
    before_action :authenticate_user!
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit(:name, :email, :password, :password_confirmation, :email_confirmation)
      end
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :email, :password, :current_password)
      end
    end
  
    def after_sign_in_path_for(_resource)
      root_path
    end
  end
  