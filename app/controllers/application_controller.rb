class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning

  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_locale
  before_action :api_metal_price

  include ApiMetalHelper
  include HomeHelper

  def chart
  end
  def api_metal_price
    printf "\033[;41m=================================Api Metla=====================================\033[0m\n"
    api_metal
    api_metal_console
    puts Rails.root
    puts Rails.root.join
    printf "\033[;41m================================Een Api Metal==================================\033[0m\n"
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

  def require_user_logged_in!
    redirect_to new_user_session_path, alert: "Musisz być zalogowany" if !user_signed_in?
  end

  def require_admin_logged_in!    
      redirect_to new_user_session_path, alert: "Musisz być zalogowany(2)" if (!require_user_logged_in_admin!)
  end  

  protected
  def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:email, :name, :lastname, :role, :password)}
      devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:email, :name, :lastname, :role, :password,
          :current_password )}

  end
  
  private
    def default_url_options
      { locale: I18n.locale }
    end

    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
    end
    def extract_locale
      parsed_locale = params[:locale]
      I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
    end


end
