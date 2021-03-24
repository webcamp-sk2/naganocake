class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

<<<<<<< HEAD

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [
=======
 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [
>>>>>>> f8fead0f74892891ae2c52da895f9bd6100c8f33
    :last_name,
    :first_name,
    :last_name_kana,
    :first_name_kana,
    :postal_code,
    :prefecture_name,
    :telephone_number,
    :address
<<<<<<< HEAD
  ])
end

=======
   ])

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    end
  end
 end
>>>>>>> f8fead0f74892891ae2c52da895f9bd6100c8f33
end
