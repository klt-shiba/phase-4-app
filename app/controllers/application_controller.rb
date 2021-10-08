
class ApplicationController < ActionController::Base
     ## Helper method to find current User
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end
end
