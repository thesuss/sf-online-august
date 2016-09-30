class RegistrationsController < Devise::RegistrationsController

  protected

  def sign_up_params
    params.require(:user).permit(:name, :email, :address, :password, :password_confirmation)

  end

  def after_sign_up_path_for(resource)
    restaurant_path
  end

end
