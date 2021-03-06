class Bid < ActiveRecord::Base
  belongs_to :bidder
  belongs_to :job

  validates :bid_amount, presence: true
  validates :comment, presence: true

  ##
  ## Find and show bids related to the job
  ##
  def self.show_related_bids_only(job)
    @bids = Bid.all.select { |bid| bid.job_id == job.id }
  end

  def self.show_results
    Bid.all
  end
end
