class User < ActiveRecord::Base
  has_one :bidder
  has_one :poster

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, length: { minimum: 10, maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password

  def show_jobs
    jobs
  end

  def self.create_from_omniauth(auth)
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.username = auth['info']['first_name']
      u.email = auth['info']['email']
      u.password = SecureRandom.hex(24)
    end
  end
end
