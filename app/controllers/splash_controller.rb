class SplashController < ApplicationController
  # GET /requests
  # GET /requests.xml
  #before_filter :authenticate_employee!

  def index
    @title = "Splash"
  end
end
