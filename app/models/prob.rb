class Prob < ActiveRecord::Base
  attr_accessible :auther, :state, :title, :url, :prob_id
  has_many :states
end
