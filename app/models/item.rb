class Item < ActiveRecord::Base
  belongs_to :poll, inverse_of: :items
  has_many :votes, dependent: :destroy, inverse_of: :item

  attr_accessible :answer

  validates :poll, presence: true
  validates :answer, presence: true
end
