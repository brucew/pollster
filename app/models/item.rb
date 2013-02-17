class Item < ActiveRecord::Base
  belongs_to :poll

  attr_accessible :poll, :answer

  validates :answer, presence: true
end
