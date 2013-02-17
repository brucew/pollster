class Vote < ActiveRecord::Base
  belongs_to :item
  has_one :poll, through: :item

  attr_accessible :item_id

  validates :ip_address, presence: true
end
