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
  end

  def create
    @user = User.find_by(id: params[:user_id])
    @poster = Poster.find_or_create_by(user_id: @user.id)
    @job = Job.new(job_params)
    @job.poster_id = @poster.id

    if @job.save
      redirect_to user_job_path(@job.poster_id, @job.id)
    else
      flash[:message] = @job.errors.full_messages
      render :new, notice: @message
    end
  end

  def popular
    @jobs = Job.most_popular
  end

  def category
    @jobs = Job.is_category(params[:category])
  end

  def edit
    @job = Job.find_by(id: params[:id])
  end

  def update
    @job = Job.find_by(params[:id])
    if @job.update(job_params)
      redirect_to user_job_path(@job.poster_id, @job.id)
    else
      @message = 'Your details are incorrect. Please try again.'
      render :edit, notice: @message
    end
  end

  def destroy
    @job = Job.find_by(params[:id])
    @job.delete
    redirect_to user_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :category, :description, :price, :day, :time, :poster_id)
  end
end
