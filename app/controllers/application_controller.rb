class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    writer_attributes = [:username]
    devise_parameter_sanitizer.permit :sign_up, keys: writer_attributes
    devise_parameter_sanitizer.permit :account_update, keys: writer_attributes
  end
end
