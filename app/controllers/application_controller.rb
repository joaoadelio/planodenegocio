class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?

    protected

    protect_from_forgery with: :exception
    rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to main_app.root_url, notice: exception.message }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone, :email])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :email, bank_attributes: [:bank_name, :bank_account]])
    end
    
    def after_sign_in_path_for(resource_or_scope)
        contextualization_new_path 
    end
    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end
end
