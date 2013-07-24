class Discussion < ActiveRecord::Base
  attr_accessible :question, :time
  validates :question, :presence => true
end
