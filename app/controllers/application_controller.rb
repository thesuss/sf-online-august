class ApplicationController < ActionController::Base
  include CanCan::ControllerAdditions
  protect_from_forgery with: :exception
  before_action :store_current_location, unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
    # Message is 'You are not authorized to access this page'
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    item = params[:controller].singularize.capitalize
    if exception.message == "Couldn't find #{item} with 'id'=#{params[:id]}"
      flash[:alert] = item + ' not found'
      redirect_to request.referer ? :back : root_url
    end
  end

  def owner_has_restaurant?
    if Restaurant.exists?(user: current_user)
      true
    else
      flash[:alert] = 'Please create your restaurant before continuing'
      redirect_to new_restaurant_path
    end
  end

  private
  def store_current_location
    store_location_for(:user, request.url)
  end
end
