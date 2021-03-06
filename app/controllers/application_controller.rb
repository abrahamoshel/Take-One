class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_anyone!

  def authenticate_anyone!
    if manager_signed_in?
      authenticate_manager!
    else
      authenticate_employee!
    end
  end
  
  
  #before_filter :authenticate

private
# Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

#def authenticate
#  authenticate_or_request_with_http_basic "Notice: Unauthoized access of this site is prohibited. By proceeding form this point, you agree to comply with all Terms & Conditions applying to the use of this site. You will be held responsible for the appropriate use of the ID and password used to access this site, as well as all information accessed on this site. ----------------------------------------- Accessing this site during non-work hours should be for the limited purpose of viewing and checking your work schedule. Any other use of this site must be completed during manger approved and scheduled work time." do |user_name, password|
#    user_name == USER_NAME && password == PASSWORD
#  end
#end

end
