class SessionsController < ApplicationController
  def home
    render :login unless session.include? :user_id
    @user = User.find_by_id(session[:user_id])
  end

  def login
    if session[:user_id]
      redirect_to root_path
    end
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @message = 'Your email address or password is incorrect. Please try again.'
      render :login, notice: [@message, @user]
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
