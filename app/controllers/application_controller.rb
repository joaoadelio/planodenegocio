class ApplicationController < ActionController::Base
    protect_from_forgery
    
    def after_sign_in_path_for(resource_or_scope)
        contextualization_new_path 
    end
    def after_sign_up_path_for(resource)
        after_sign_in_path_for(resource)
    end
end
