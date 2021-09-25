class SessionsController < ApplicationController
  def home
    render :login unless session.include? :user_id
    @user = User.find_by_id(session[:user_id])
  end

  def login; end

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      puts '====================================='
      @message = 'Your email address or password is incorrect. Please try again.'
      render :login, notice: [@message, @user]
    end
  end

  def destroy
    session.delete :user_id
    redirect_to login_path
  end

  private

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
