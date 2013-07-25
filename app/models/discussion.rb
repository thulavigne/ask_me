class Discussion < ActiveRecord::Base
  attr_accessible :question, :time
  validates :question, :presence => true
  has_many :responses
end
