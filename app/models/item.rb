class Item < ActiveRecord::Base
  belongs_to :poll

  attr_accessible :answer

  validates :answer, presence: true
end
