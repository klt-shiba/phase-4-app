class SessionsController < ApplicationController
  def home
    ## Render login unless sesion includes user ID
    render :login unless session.include? :user_id

    ## Initiliase variables for user and jobs so we can add them to dashboard
    @user = User.find_by_id(session[:user_id])
    @jobs = Job.most_recent
    puts '********************'
    puts @user
  end

  def login
     ## If sessions has user ID, redirect to homepage/dashboard
    redirect_to root_path if session[:user_id]
  end

  def create
    ## Initialise variable using usernames param
    @user = User.find_by(username: user_params[:username])

    ## If user exists and password is correct
    if @user && @user.authenticate(user_params[:password])
      
      ## Set session id with user id
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:message] = 'Your email address or password is incorrect. Please try again.'
      render :login, notice: @user
    end
  end

  def destroy

    ## log user out by deleting their session id
    session.delete :user_id
    redirect_to login_path
  end

  ## non restful custom route
  ## log users with omniauth
  def omniauth
    ## Argument to find or create
    ## Class method to create user from omniauth.
    ## Pass in auth argument
    @user = User.create_from_omniauth(auth)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:message] = @user.errors.full_messages
      redirect_to login_path
    end
  end

  private

  def auth
    ## Print out clean hash of user  auth
    ## pp request.env['omniauth.auth']
    request.env['omniauth.auth']
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
