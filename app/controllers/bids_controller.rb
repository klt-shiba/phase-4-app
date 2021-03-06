class BidsController < ApplicationController
  def new
    @bid = Bid.new
    @job = Job.find_by(id: params[:job_id])
  end

  def create
    ## Initialise variables below to create bid, find job ID, userID from sessions and bidder ID. 
    @bid = Bid.new(job_params)
    @job = Job.find_by(id: params[:job_id])
    @user = User.find_by_id(session[:user_id])
    @bidder = Bidder.find_or_create_by(user_id: @user.id)
    
    ## Set bid job_id and bid bidder_id
    @bid.job_id = @job.id
    @bid.bidder_id = @bidder.id

    ## Save and redirect /user/id/jobs/id page
    if @bid.save
      redirect_to user_job_path(@user.id, @job.id)
    else
      puts 'Borked'
      flash[:message] = @bid.errors.full_messages
      render :new
    end
  end

  def show
    @bid = Bid.find_by(id: params[:job_id])
  end

  def index
    @bids = Bid.all
  end

  private

  def job_params
    params.require(:bid).permit(:bid_amount, :comment, :bidder_id, :job_id)
  end
end
