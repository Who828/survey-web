class Option < ActiveRecord::Base
  belongs_to :radio_question
  attr_accessible :name
end
