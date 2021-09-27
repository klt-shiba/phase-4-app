class Bidder < ActiveRecord::Base
  belongs_to :user

  has_many :bids
  has_many :jobs, through: :bids

  def self.create_bidder(user)
    if Bidder.exists?(user_id: user.id)
      puts "I'm an existing bidder"
      puts user.username
      user
    else
      puts "I'm a new bidder"
      new_bidder = Bidder.new
      new_bidder.user_id = user.id
      new_bidder.save
      new_bidder
    end
  end
end
