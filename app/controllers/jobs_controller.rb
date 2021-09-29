class JobsController < ApplicationController
  def index
    @jobs = if params[:user_id]
              User.find(params[:user_id]).jobs
            elsif !params[:category].blank?
              Job.where(category: params[:category])
            else
              ## No filter applied
              Job.all
            end
  end

  def show
    @job = Job.find_by(id: params[:id])
    @bids = Bid.show_related_bids_only(@job)
  end

  def new
    @job = Job.new
    @user = User.find_by(id: params[:user_id])

  end

  def create
    @job = Job.new(job_params)
    @user = User.find_by(id: params[:user_id])

    puts "jobs controller create"
    puts @user.username
    @poster = Poster.create_poster(@user)

    @job.poster_id = @poster.id

    if @job.save
      redirect_to user_job_path(@job.poster_id, @job.id)
    else
      @message = 'Your details are incorrect. Please try again.'
      render :new, notice: @message
    end
  end

  def edit
    @job = Job.find_by(params[:id])
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
    params.require(:job).permit(:title, :category, :location, :description, :price, :day, :time)
  end
end
