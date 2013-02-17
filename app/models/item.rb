class Item < ActiveRecord::Base
  belongs_to :poll
  has_many :votes

  attr_accessible :answer

  validates :answer, presence: true
end
