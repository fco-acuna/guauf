class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:home, :index]

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone_number, :address, :about_me, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone_number, :address, :about_me, :photo])
  end

end
