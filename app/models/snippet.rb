class Snippet < ActiveRecord::Base
  attr_accessible :description, :language, :name, :source, :version
  belongs_to :code
  validates :description, :language, :name, :source, :version, :presence => true
end
