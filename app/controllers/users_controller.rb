class UsersController < ApplicationController


    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if  @user.save
            session[:user_id] = @user.id
            redirect_to root_path
            puts "________________________________"
            puts "User is valid"
            #notice: "Thanks you for signing up !!!"
        else
            puts "++++++++++++++++++++++++++++++++"
            puts "User is not valid"
            render :new
        end
    end

    def show
        @name = User.find_by(params[:id])
    end

    def index
        @users = User.all
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end