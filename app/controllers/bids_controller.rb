class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end

  def create
    @bid = Bid.new(job_params)
    @bid.save
    @job = Job.find_by(id: params[:job_id])
    @user = User.find_by_id(session[:user_id])
    @bidder = Bidder.create_bidder(@user)

    @bid.job_id = @job.id
    @bid.bidder_id = @bidder.id

    puts "========================"
    puts @bid.job_id
    puts @bid.bidder_id
    puts @bid.bid_amount
    puts @bid.comment
    puts @bid

    if @bid
        @bid
        redirect_to user_job_path(@user.id, @job.id)
    else
        puts "Borked"
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
    params.require(:bid).permit(:bid_amount, :comment)
  end
end
