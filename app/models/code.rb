class Code < ActiveRecord::Base
  attr_accessible :author, :commitmsg, :description, :language, :name, :password, :snippet, :version
  validates :author, :description, :language, :name, :password, :snippet, :version, :presence => true
end
