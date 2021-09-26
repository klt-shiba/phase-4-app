class JobsController < ApplicationController
  
  
 def index
    @jobs = if params[:user_id]
        User.find(params[:user_id]).jobs
    else
        Job.all
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    puts "====================="
    puts @user = User.find_by(params[:id])
    puts @job.user_id = @user.id

    if @job.save
      redirect_to user_job_path(@job.user_id, @job.id), notice: @user
    else
      @message = 'Your details are incorrect. Please try again.'
      render :new, notice: @message
    end
  end

  private 

  def job_params
    params.require(:job).permit(:title, :category, :description, :price, :day, :time)
  end
end
