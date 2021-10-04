class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create

    ## Initialise user by creating new user and passing in user_params method
    @user = User.new(user_params)
    
    ## If user saves, set session id to user id and direct customer to home page
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: @user
    else
      @message = 'Your details are incorrect. Please try again.'
      render :new, notice: @message
    end
  end

  def show
    ## Initilise variables for user and poster so we can show them on profile page
    @user = User.find_by(id: params[:id])
    @poster = Poster.find_by(user_id: params[:id]) ? Poster.find_by(user_id: params[:id]) : nil 
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find_by(id: params[:id])
    @url = user_path
  end

  def update
    @url = user_path
    @user = User.find_by(id: params[:id])
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

end
