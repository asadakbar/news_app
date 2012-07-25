class Link < ActiveRecord::Base

  attr_accessible :url, :user_id
  validates :url, :uniqueness => true
  belongs_to :user

end
