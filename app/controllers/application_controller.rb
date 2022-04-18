class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :initialize_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :cart

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:email, :password, :address, :city, :province_id, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:email, :password, :address, :city, :province_id, :current_password,
               :password_confirmation)
    end
  end

  private

  def initialize_session
    session[:shopping_cart] ||= []
  end

  def cart
    Record.find(session[:shopping_cart])
  end
end
