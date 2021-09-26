class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: @user
    else
      @message = 'Your details are incorrect. Please try again.'
      render :new, notice: @message
    end
  end

  def show
    @user = User.find(params[:id])

    puts "====================="
    puts @user.username
    puts @user.id
    @jobs = @user.jobs
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      @message = 'Your details are incorrect. Please try again.'
      render :edit, notice: @message
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
