class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

 def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up, keys: [

    :last_name,
    :first_name,
    :last_name_kana,
    :first_name_kana,
    :postal_code,
    :prefecture_name,
    :telephone_number,
    :address
  ])
 end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      new_admin_session_path
    when :public
      new_public_session_path
    end
  end
  
  def after_sign_in_path_for(resource)
    case resource
    when :admin
      admin_customers_path
    end
  end
  
  def after_sign_up_path_for(resource)
    case resource
    when :public
      public_customer_path(current_custoumer)
    end
  end  
end

