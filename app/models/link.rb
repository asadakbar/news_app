class Link < ActiveRecord::Base

  attr_accessible :url, :user_id, :title, :vote_total
  before_validation :strip_white_spaces
  validates :url, :uniqueness => true
  belongs_to :user
  has_many :votes
  before_save :http_validation

  def strip_white_spaces
    self.url = self.url.strip
  end

  def http_validation
    if (self.url =~ /(http|https):\/\//) != 0
      self.url.insert(0, 'http://')
    end
  end

  def can_be_voted_on_by?(user)
    user.id != self.user_id && voted_on_by?(user)
  end

  def voted_on_by?(user)
    self.votes.select {|vote| vote.user_id == user.id}.empty?
  end

end