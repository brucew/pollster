class Poll < ActiveRecord::Base
  has_many :items

  accepts_nested_attributes_for :items, :allow_destroy => true
  attr_accessible :question, :items_attributes

  validates :question, presence: true
  validates :items, length: { in: 2..5 }
end
