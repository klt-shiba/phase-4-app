class JobsController < ApplicationController
  def index
    @jobs = if params[:user_id]
              User.find(params[:user_id]).jobs
            else
              Job.all
            end
  end

  def show
    @job = Job.find_by(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    @user = User.find_by(params[:id])
    @job.user_id = @user.id

    if @job.save
      redirect_to user_job_path(@job.user_id, @job.id), notice: @user
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
      redirect_to user_job_path(@job.user_id, @job.id)
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
    params.require(:job).permit(:title, :category, :description, :price, :day, :time)
  end
end
