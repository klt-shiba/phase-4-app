class Poster < ActiveRecord::Base
  belongs_to :user
  has_many :jobs

  ##
  ## Check if the user is poster?
  ## if they are: Return the poster
  ##
  ## if they are not: Create a new poster and assign the user_id
  ##
  def self.create_poster(user)
    if Poster.exists?(user_id: user.id)
      puts "I'm an existing user"
      puts user.username  
      user
    else
      puts "I'm a new user"
      new_poster = Poster.new

      new_poster.user_id = user.id
      new_poster.save
    end
  end

  def self.what_is_my_name(user)
    @name = Poster.find_by()
  end

end
