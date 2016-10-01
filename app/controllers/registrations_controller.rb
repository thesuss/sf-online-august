class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)

  end

  def after_sign_up_path_for(resource)
    #this is highly temporary and needs to be the page you were on, and it should be by default... 
    carts_path
  end

end
