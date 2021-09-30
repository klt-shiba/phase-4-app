class Bid < ActiveRecord::Base
  belongs_to :bidder
  belongs_to :job

  validates :bid_amount, presence: true

  scope :most_popular, -> { select('job_id, count(job_id) as count').group(:job_id).order('count desc').limit(10) }


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
