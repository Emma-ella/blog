class ApplicationController < ActionController::Base
    include Pundit::Authorization
    if Rails.env.development? 
        # This one is for github codespace
        skip_before_action :verify_authenticity_token 
    end
    
end
