class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def signout
    redirect_to root_path
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

end
