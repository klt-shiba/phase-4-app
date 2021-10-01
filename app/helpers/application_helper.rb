module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  ## Helper method to find current User
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if !!session[:user_id]
  end

  ## Helper method to return name of the poster from Job object
  def job_poster(job)
    @job_poster = User.find_by_id(job.poster_id)
    @job_poster.username
  end

  ## Helper method to return name of the poster from Job object
  def job_bidder(bid)
    @job_bidder = User.find_by_id(bid.bidder_id)
    @job_bidder.username
  end
end
