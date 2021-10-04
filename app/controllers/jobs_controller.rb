class JobsController < ApplicationController

  def index
    @jobs = if params[:user_id]
              User.find(params[:user_id]).jobs
            elsif params[:q]
              ## If search param exists, pass search argument into Job object and invoke search class method
              Job.search(params[:q].downcase)
            else
              ## No filter applied
              Job.all
            end
  end

  def show
    ## Check and see if job id is valid otherwise redirect to homepage
    @job = Job.find_by(id: params[:id]) || redirect_to(root_path)
    @bids = Bid.show_related_bids_only(@job)
  end

  def new
    @job = Job.new
    @user = User.find_by(id: params[:user_id])
    @url = user_jobs_path
  end

  def create
    ## Initialise variables below for user, poster by finding or creating, creating new Job and url helper which we pass into our partial so we can use same partial for edit and new
    @url = user_jobs_path
    @user = User.find_by(id: params[:user_id])
    @poster = Poster.find_or_create_by(user_id: @user.id)
    @job = Job.new(job_params)

    ## Set Job Poster_id to Poster.id
    ## Job belongs to Poster
    @job.poster_id = @poster.id

    ## If Job saves, redirect to users/id/job
    if @job.save
      redirect_to user_job_path(@poster.user_id, @job.id)
    else
      flash[:message] = @job.errors.full_messages
      render :new, notice: @message
    end
  end

  def popular
    ## Scope method for most popular Jobs. This is based on how many bids so probably not really "most popular"
    @jobs = Job.most_popular
  end

  def category
    ## Scope method to find all items in table that match category name
    ## category param is passed into scope method when this customer Jobs controller method is called
    @jobs = Job.is_category(params[:category])
  end

  def edit
    ## Initialise variable for URL helper which we pass to forms partial
    @job = Job.find_by(id: params[:id])
    @url = user_job_path
  end

  def update
    ## Initialise variables for user, job and poster
    @url = user_job_path
    @user = User.find_by(id: params[:user_id])
    @job = Job.find_by(id: params[:id])
    @poster = Poster.find_by(user_id: @user.id)

    ## If job updates redirect to user/id/jobs/id to view job
    if @job.update(job_params)
      redirect_to user_job_path(@poster.user_id, @job.id)
    else
      @message = 'Your details are incorrect. Please try again.'
      render :edit, notice: @message
    end
  end

  # def destroy
  #   @job = Job.find_by(params[:id])
  #   @job.delete
  #   redirect_to user_path
  # end

  private

  def job_params
    params.require(:job).permit(:title, :category, :description, :price, :day, :time, :poster_id)
  end
end
