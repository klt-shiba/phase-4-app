module SessionHelper
    def logged_in?
        !!session[:user_id]
      end
    
      def logged_in_user
        unless logged_in?
           flash[:danger] = "Please log in."
           redirect_to "/login"
        end
     end
    
end