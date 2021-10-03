module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_path
    end
  end

  ## Helper method to find current User
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  ## Helper method to return user object who posted job
  def job_poster(job)
    @poster = Poster.find_by_id(job.poster_id)
    @job_poster = User.find_by_id(@poster.user_id)
    ## return User that matches user_id in Posters database
    @job_poster
  end

  ## Helper method to return user object from bidder object
  def job_bidder(bid)
    @bidder = Bidder.find_by_id(bid.bidder_id)
    @job_bidder = User.find_by_id(@bidder.user_id)
    @job_bidder
  end
end
