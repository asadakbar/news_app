class Link < ActiveRecord::Base

  attr_accessible :url, :user_id, :title
  before_validation :strip_white_spaces
  validates :url, :uniqueness => true
  belongs_to :user
  before_save :http_validation

  def strip_white_spaces
    self.url = self.url.strip
  end

  def http_validation
    if (self.url =~ /(http|https):\/\//) != 0
      self.url.insert(0, 'http://')
    end
  end
end
