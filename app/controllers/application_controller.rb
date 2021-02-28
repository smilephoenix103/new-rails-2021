class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?

  def chart
  end

  def require_user_logged_in_admin!
    if (current_user != nil)
      if (user_signed_in? && current_user.role == 'admin')
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def require_user_logged_in_user!
    redirect_to new_user_session_path, alert: "Musisz być zalogowany" if !user_signed_in?
  end

  def require_user_logged_in!    
      redirect_to new_user_session_path, alert: "Musisz być zalogowany" if (!require_user_logged_in_admin!)
  end  

  protected
  def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :name, :lastname, :role, :password)}
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :name, :lastname, :role, :password,
          :current_password )}

  end

end
