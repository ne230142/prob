class State < ActiveRecord::Base
  attr_accessible :ans, :compo, :prob_id, :state
  belongs_to :prob
end
