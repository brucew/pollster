class Vote < ActiveRecord::Base
  belongs_to :item, inverse_of: :votes
  has_one :poll, through: :item

  attr_accessible :item_id

  validates :item, presence: true
  validates :ip_address, presence: true
end
