class ApplicationController < ActionController::Base
    include ExceptionHandler
    
    skip_before_action :verify_authenticity_token   
end
