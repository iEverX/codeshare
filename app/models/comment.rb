class Comment < ActiveRecord::Base
  attr_accessible :content, :email, :nick, :page
  belongs_to :code
  validates :email, :nick, :content, :presence => true
end
