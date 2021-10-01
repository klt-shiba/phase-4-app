class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(job_params)
    @job = Job.find_by(id: params[:job_id])
    @user = User.find_by_id(session[:user_id])
    @bidder = Bidder.create_or_find_bidder(@user)

    @bid.job_id = @job.id
    @bid.bidder_id = @bidder.id

    
    puts "---------------"
    puts @bid.bid_amount
    puts @bid.job_id
    puts @bid.bidder_id
    puts @bid.comment

    puts @bid.save

    if @bid.save
      redirect_to user_job_path(@user.id, @job.id)
    else
      puts 'Borked'
      flash[:message] = @bid.errors.full_messages.join(' ')
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
