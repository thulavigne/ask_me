class Response < ActiveRecord::Base
  belongs_to :discussion
  attr_accessible :answer, :at
  validates :answer, :presence => true
end
