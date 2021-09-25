class SessionsController < ApplicationController


    def home

        render :login unless session.include? :user_id
    end

    def login
        
    end


    def create
        @user = User.find_by(email: params[:email])

        if !!@user && @user.authenticate(params[:password])

            session[:user_id] = @user.id
            redirect_to user_path
        else 
            puts "====================================="
            message = "Invalid"
            redirect_to login_path, notice: message
        end
    end


    private
    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end