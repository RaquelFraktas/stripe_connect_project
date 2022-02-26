class HomeController < ApplicationController
  # before_action :authenticate_user!
    
  def index
    @user = current_user
    @no_user = !user_session
  end
  
end
